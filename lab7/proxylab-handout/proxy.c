/*
 * proxy.c - CS:APP Web proxy
 *
 * TEAM MEMBERS:
 *    *郑淇木 1100012849 (Part I II)
 *     赵天雨 1100012957 (Part III)
 * 
 * IMPORTANT: 
 *     Proxy:
 *             Multi-thread:    Supported
 *             Robustness:      -Examine almost every return value
 *                               Return and print error message when encountering error
 *                              -Deal with races of threads carefully
 *                              -Replace thread-unsafe function with thread-safe one
 *     Cache: 使用一个缓存结构（Cache）来对缓存进行管理。
 *            使用一个节点（Node）链表来进行实际内容的缓存，根据 uri 对一个节点进行唯一的标记。
 *            当缓存空间剩余足够的时候，直接将节点添加到链表尾部。
 *            当缓存空间不足的时候，删除链表尾部的节点直到有足够的剩余空间。  
 */ 

#include "csapp.h"
#include "cache.h"
// #define DEBUG
#ifdef DEBUG
# define proxy_dbgprintf(...) printf(__VA_ARGS__)
#else
# define proxy_dbgprintf(...)
#endif
Cache cache;
/*
 * constant string
 * for constructing the header
 */
const char *nothing = "";
const char *user_agenthdr = "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3)Gecko/20120305 Firefox/10.0.3\r\n";
const char *accepthdr = "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n";
const char *acceptencoding = "Accept-Encoding: gzip, deflate\r\n";
const char *connection = "Connection: close\r\n";
const char *proxyconnection = "Proxy-Connection: close\r\n";


/* mutex */
static sem_t * mutex;
static sem_t * thread_count;

/*
 * Function prototypes
 */
int parse_uri(char *uri, char *target_addr, char *path, int  *port);
void format_log_entry(char *logstring, struct sockaddr_in *sockaddr, char *uri, int size);
void serve(int fd); 
void *thread(void *vargp);
int open_clientfd_thread_safe(char *hostname, int port);
struct hostent *gethostbyname_thread_safe(const char *name);
const char* request_examiner(char *buf); 


/* 
 * main - Main routine for the proxy program 
 */
int main(int argc, char **argv)
{

    /* Check arguments */
    
    if (argc != 2) {
	fprintf(stderr, "Usage: %s <port number>\n", argv[0]);
	exit(0);
    }
    int count = 0;
    signal(SIGPIPE,SIG_IGN);
    int listenfd,  port;
    int *connfdp;
    pthread_t tid;
    socklen_t clientlen;
    struct sockaddr_in clientaddr;

    cache = init_cache();

    port = atoi(argv[1]);
    listenfd = Open_listenfd(port);
    sem_unlink("mutex");
    sem_unlink("thread_count");
    mutex = sem_open("mutex", O_CREAT, 0644, 1);
    thread_count = sem_open("thread_count", O_CREAT, 0644, 15);

    while(1)
    {
        connfdp = (int *)malloc(sizeof(int));
        clientlen = sizeof(clientaddr);

        proxy_dbgprintf("waiting\n");

        sem_wait(thread_count);
        // int t_cnt = 12344, m_cnt = 12344, thread_cnt, mutex_cnt;
        // mutex_cnt = sem_getvalue(mutex, &m_cnt);
        // thread_cnt = sem_getvalue(thread_count, &t_cnt);
        // printf("mutex_count: %d\n", m_cnt);
        // printf("thread_count: %d\n", t_cnt);
        *connfdp = Accept(listenfd, (SA *)&clientaddr, &clientlen);
        if (connfdp == NULL)
        {
            sem_post(thread_count);
            continue;
        }


        count++;
        proxy_dbgprintf("serve: %d\n",count );

        Pthread_create(&tid, NULL, thread, connfdp);
    }

    exit(0);
}


/*
 * serve - serve client with proxy service
 *
 * Given the descriptor of the client
 * Get information from Internet and transfer to client
 * Return when encountering with errors with message printed
 * 
 */
void serve (int client_fd)
{
    /*
     * Variables used int this function
     */

    rio_t server_interface;
    rio_t client_interface;
    int read_record, is_requestline = 1;  
    char buf[MAXLINE], method[10], uri[MAXLINE], request[MAXLINE],
          path[MAXLINE], hostname[MAXLINE];
    
    int serverfd, port, length = 0;

    /*Cache the response and record its length */
    char cache_res[MAX_OBJECT_SIZE];
    int cache_res_len;

    /* 
     * Read request from client.
     * Change the request when necessary
     */
    rio_readinitb(&client_interface, client_fd);
    while((read_record = rio_readlineb(&client_interface,buf,MAXLINE)) > 0)
    {
        if (is_requestline)
        {
            is_requestline = 0;
            sscanf(buf,"%s %s",method,uri);
            if (strcasecmp(method, "GET"))
            {                   
                printf("proxy JUST for GET.\n");
                return;
            }
            printf("%s %s\n",method, uri );
            parse_uri(uri,hostname,path, &port);
            sprintf(request,"%s %s HTTP/1.0\r\n",method, uri);
            strcat(request,user_agenthdr);
            strcat(request,accepthdr);
            strcat(request,acceptencoding);
            strcat(request,proxyconnection);
            strcat(request,connection); 
        }
        else
        {
            if (!strcmp(buf,"\r\n"))
            {
                break;
            }
            strcat(request,request_examiner(buf));
        }
    }

    if (strlen(request) == 0)
    {
        /*If nothing read, return*/
        return;
    }
    /* CHECK whether the header has sub-string "Host"*/
    if( !strstr(request,"Host"))
    {
        // If not, append a host header
        strcat(request,"Host: ");
        strcat(request,hostname);
        strcat(request,"\r\n");
    }
    /* Append the blank line */
    strcat(request,"\r\n");


    proxy_dbgprintf("%s",request );


    /* error when reading from client */
    if (read_record < 0)
    {
        printf("Error when reading from client\n");
        return;
    }

    /* Check the cache */
    if ((cache_res_len = read_cache(cache, uri, cache_res)) > 0)
    {
        // If found in cache

        proxy_dbgprintf("reading cache, uri: %s\n", uri);       
        rio_writen(client_fd, cache_res, cache_res_len);

        printf("Successfully read from cache!\n");

        return;
    }
    
    else
    {
        // If not found in cache
        proxy_dbgprintf("not in cache, uri: %s\n", uri);

        /* Communicate with remote server */
        if((serverfd = open_clientfd_thread_safe(hostname, port)) < 0){
            printf("Open Server failed.\n");      
            return;
        }

        proxy_dbgprintf("Successfully open remote server\n" );

        /* Send request to remote server */
        rio_readinitb(&server_interface, serverfd);
        if (rio_writen(serverfd,request,strlen(request)) < 0)
        {
            // Fail to open remote server
            printf("Error Fail to send request to remote server\n");
            Close(serverfd);
            return;
        }


        proxy_dbgprintf("Successfully send request to remote server\n" );


        /* Read from server and write to client*/
        char *cache_res_ptr = cache_res;
        while ((read_record = rio_readnb(&server_interface,buf,MAXLINE)) > 0)
        {


            proxy_dbgprintf("Read %d bytes\n",read_record );

            rio_writen(client_fd,buf,read_record);
            cache_res_ptr = cache_res + length;
            length += read_record;
            
            /* Cache the response if the size does not exceed the range */
            if (length <= MAX_OBJECT_SIZE)
            {
                memcpy((char *)cache_res_ptr, buf, read_record);
            }
        }

        proxy_dbgprintf("Successfully serve the client\n" );

        /* Error when write to the client*/
        if (read_record < 0)
        {
            printf("Error when write back to client\n");
        }

        printf("Content-size: %d\n",length );

        /* Cache the response if the size does not exceed the range */
        if (length <= MAX_OBJECT_SIZE)
            write_cache(cache, uri, cache_res, length);
    }

    Close(serverfd);

}

/*
 * parse_uri - URI parser
 * 
 * Given a URI from an HTTP proxy GET request (i.e., a URL), extract
 * the host name, path name, and port.  The memory for hostname and
 * pathname must already be allocated and should be at least MAXLINE
 * bytes. Return -1 if there are any problems.
 */
int parse_uri(char *uri, char *hostname, char *pathname, int *port)
{
    char *hostbegin;
    char *hostend;
    char *pathbegin;
    int len;

    if (strncasecmp(uri, "http://", 7) != 0) {
	hostname[0] = '\0';
	return -1;
    }
       
    /* Extract the host name */
    hostbegin = uri + 7;
    hostend = strpbrk(hostbegin, " :/\r\n\0");
    len = hostend - hostbegin;
    strncpy(hostname, hostbegin, len);
    hostname[len] = '\0';
    
    /* Extract the port number */
    *port = 80; /* default */
    if (*hostend == ':')   
	*port = atoi(hostend + 1);
    
    /* Extract the path */
    pathbegin = strchr(hostbegin, '/');
    if (pathbegin == NULL) {
	pathname[0] = '\0';
    }
    else {
	pathbegin++;	
	strcpy(pathname, pathbegin);
    }

    proxy_dbgprintf("In parse_uri: Host: %s\n\n",hostname );

    return 0;
}

/*
 * format_log_entry - Create a formatted log entry in logstring. 
 * 
 * The inputs are the socket address of the requesting client
 * (sockaddr), the URI from the request (uri), and the size in bytes
 * of the response from the server (size).
 */
void format_log_entry(char *logstring, struct sockaddr_in *sockaddr, 
		      char *uri, int size)
{
    time_t now;
    char time_str[MAXLINE];
    unsigned long host;
    unsigned char a, b, c, d;

    /* Get a formatted time string */
    now = time(NULL);
    strftime(time_str, MAXLINE, "%a %d %b %Y %H:%M:%S %Z", localtime(&now));

    /* 
     * Convert the IP address in network byte order to dotted decimal
     * form. Note that we could have used inet_ntoa, but chose not to
     * because inet_ntoa is a Class 3 thread unsafe function that
     * returns a pointer to a static variable (Ch 13, CS:APP).
     */
    host = ntohl(sockaddr->sin_addr.s_addr);
    a = host >> 24;
    b = (host >> 16) & 0xff;
    c = (host >> 8) & 0xff;
    d = host & 0xff;


    /* Return the formatted log entry string */
    sprintf(logstring, "%s: %d.%d.%d.%d %s", time_str, a, b, c, d, uri);
}

/*
 * request_examiner - Change the given request when necessary
 *
 */
const char* request_examiner(char *buf)
{
    if (strstr(buf,"User-Agent"))
        return nothing;
    if (strstr(buf,"Accept:"))
        return nothing;
    if (strstr(buf,"Accept-Encoding:"))
        return nothing;
    if (strstr(buf,"Proxy-Connection"))
        return nothing;
    if (strstr(buf,"Connection"))
        return nothing;
    return buf;
}

/*
 * thread - thread created by main routine
 *
 * Each thread serve a seperate client
 */
void *thread(void *vargp)
{
    int connfd = *((int *) vargp);
    pthread_detach(pthread_self());
    free(vargp);
    serve(connfd);
    Close(connfd);
    sem_post(thread_count);
    return NULL;

}

/* 
 * open_clientfd_thread_safe-Thread-safe version of open_clientfd
 *
 * Avoid the DNS error
 */
int open_clientfd_thread_safe(char *hostname, int port)
{
    int clientfd;
    struct hostent *hp;
    struct sockaddr_in serveraddr;

    if ((clientfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
        return -1; /* check errno for cause of error */

    /* Fill in the server's IP address and port */
    if ((hp = gethostbyname_thread_safe(hostname)) == NULL)
        return -2; /* check h_errno for cause of error */
    bzero((char *) &serveraddr, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    bcopy((char *)hp->h_addr_list[0], 
      (char *)&serveraddr.sin_addr.s_addr, hp->h_length);
    serveraddr.sin_port = htons(port);

    /* Establish a connection with the server */
    if (connect(clientfd, (SA *) &serveraddr, sizeof(serveraddr)) < 0)
        return -1;
    free(hp);
    return clientfd;
}

/* 
 * gethostbyname_thread_safe-Thread-safe version of gethostbyname
 *
 * A thread-safe wrapper of gethostbyname, which is not thread-safe
 * Deep copy before return. 
 */
struct hostent *gethostbyname_thread_safe(const char *name) 
{
    struct hostent *help, *retval = (struct hostent *)malloc(sizeof(struct hostent));
    sem_wait(mutex);
    if ((help = gethostbyname(name)))
    {
        *retval = *help;
    }
    else
    {
        retval = NULL;
    }
    sem_post(mutex);
    return retval;
}