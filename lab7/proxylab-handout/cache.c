/*
 * cache.c - CS:APP Web proxy
 *
 * TEAM MEMBERS:
 *     郑淇木 1100012849 (Part I II)
 *    *赵天雨 1100012957 (Part III)
 * 
 * IMPORTANT: 
 *     Cache: 使用一个缓存结构（Cache）来对缓存进行管理。
 *            使用一个节点（Node）链表来进行实际内容的缓存，根据 uri 对一个节点进行唯一的标记。
 *            当缓存空间剩余足够的时候，直接将节点添加到链表尾部。
 *            当缓存空间不足的时候，删除链表尾部的节点直到有足够的剩余空间。  
 */ 

#include "cache.h"

// #define CACHE_DEBUG

#ifdef CACHE_DEBUG
# define c_dbgprintf(...) printf(__VA_ARGS__)
#else
# define c_dbgprintf(...)
#endif


/*
 * init_cache - initialize the cache
 * 
 * intialize the linked-list,i.e.,assign NULL to head & tail 
 * return the initialized head Node
 * 
 */
Cache init_cache()
{
    Cache c = (Cache) Malloc(sizeof(struct Cache));

    c->head = NULL;
    c->tail = NULL;

    c->cached_size = 0;
    c->left_size = MAX_CACHE_SIZE;

    // Sem_init(&(c->all), 0, 1);
    // Sem_init(&(c->write), 0, 1);
    sem_unlink("all");
    sem_unlink("write");
    c->all = (sem_open("all", O_CREAT, 0644, 1));
    c->write = (sem_open("write", O_CREAT, 0644, 1));

    c->reader_cnt = 0;

    c_dbgprintf("\n-------------------------------\n");
    c_dbgprintf("successfully init.\n");
    c_dbgprintf("-------------------------------\n");

    return c;
}

/*
 * new_node - insert a new cache node
 * 
 * Given a uri, the response and the size of response
 * Insert a node recording all the information
 * 
 */
Node new_node(char *uri, char *res, int res_size)
{
    Node n = (Node)Malloc(sizeof(struct Node));

    n->uri = Malloc(strlen(uri) + 2);
    // memcpy(n->uri, uri, strlen(uri) * sizeof(char));
    strcpy(n->uri, uri);

    c_dbgprintf("\n-------------------------------\n");
    c_dbgprintf("    -new node: %s\n", n->uri);
    c_dbgprintf("-------------------------------\n");

    n->res = Malloc(res_size);
    n->res = memcpy(n->res, res, res_size);
    n->res_size = res_size;

    return n;
}

/*
 * find_node - given a uri, find whether the cache exist or not
 * 
 * Find a cache node with given uri
 * Return NULL if nothing found
 */
Node find_node(Cache cache, char *uri)
{
    Node cur = cache->head;
    while (cur != NULL)
    {
        // c_dbgprintf("-------------------------------\n");
        // c_dbgprintf("   -uri: %s\n", uri);
        // c_dbgprintf("   -cur: %s\n", cur->uri);
        // c_dbgprintf("-------------------------------\n");
        if (strcasecmp(uri, cur->uri) == 0)
        {
            return cur;
        }
        cur = cur->next;
    }
    return NULL;
}

/*
 * evict_node - Evict node when necessary
 * 
 * Evict node with LRU-policy
 */
int evict_node(Cache cache, int res_size)
{
    // 如果 cache 的总空间不够 就不驱逐
    if (MAX_CACHE_SIZE < res_size)
    {
        return 0;
    }
    // 如果 cache 中还有足够的空间 就不驱逐
    else if (cache->left_size > res_size)
    {
        return 0;
    }
    // 如果 cache 中的空间不够了 进行驱逐
    else
    {
        // 驱逐最后一个节点 直到有足够的空间
        while (cache->left_size < res_size)
        {
            free_head(cache);
        }
    }
    return cache->left_size;
}
/*
 * free_head - free the LRU node
 * 
 * Input is the cache-list header
 * It will free the LRU node of the list
 */
int free_head(Cache cache)
{
    Node head = cache->head;
    Node tail = cache->tail;
    Node after_head = head;

    // 如果 cache 不止一个节点
    if (head != tail)
    {
        // 找到第二个节点
        after_head = head->next;

        // 释放头节点
        if (head->uri != NULL)
        {
            free(head->uri);
        }
        if (head->res != NULL)
        {
            free(head->res);
        }

        // 更新 cache 的信息
        cache->left_size += tail->res_size;
        cache->head = after_head;
    }
    // 如果 cache 只有一个节点
    else
    {
        if (tail->uri != NULL)
        {
            free(tail->uri);
        }
        if (tail->res != NULL)
        {
            free(tail->res);
        }

        // 更新 cache 的信息
        cache->left_size += tail->res_size;
        cache->head = NULL;
        cache->tail = NULL;
    }

    c_dbgprintf("\n-------------------------------\n");
    c_dbgprintf("    -successfully free tail node.\n");
    c_dbgprintf("-------------------------------\n");

    return cache->left_size;
}

/*
 * move_to_tail - After read a node in cache, mark it recently used
 *
 * Given the node, move it to the tail of list, so that it becomes the 
 * most recently used node
 *
 */
int move_to_tail(Cache cache, Node node)
{
    Node head = cache->head;
    Node tail = cache->tail;

    // 如果 cache 中只有一个节点 什么都不干
    if (head == tail)
    {
        return 0;
    }
    // 如果 cache 中有多个节点 move 之
    else
    {
        Node second = head->next;
        cache->head = second;
        tail->next = node;
        node->next = NULL;
    }
    return 1;
}


/*
 * write_cache - Write the response to the cache
 * 
 * Given uri, response, the size of response and the cache-list header
 * Insert a node with all these information
 *
 */
int write_cache(Cache cache, char *uri, char *res, int res_size)
{
    c_dbgprintf("\n-------------------------------\n");
    c_dbgprintf("    -try writing uri: %s\n", uri);

    if (res_size > MAX_OBJECT_SIZE)
        return 0;
    if (uri[strlen(uri) + 1] == '/')
        return 0;

    sem_wait(cache->write);

    evict_node(cache, res_size);

    Node new_n = new_node(uri, res, res_size);

    if (cache->head == NULL && cache->tail == NULL)
    {
        cache->head = new_n;
        cache->tail = new_n;
        new_n->next = NULL;
    }
    else
    {
        new_n->next = cache->head;
        cache->head = new_n;
        // cache->tail->next = new_n;
        // cache->tail = new_n;
    }   
    cache->left_size -= res_size;

    c_dbgprintf("    -write in cache, uri: %s\n", new_n->uri);
    c_dbgprintf("    -left size: %d\n", cache->left_size);
    c_dbgprintf("-------------------------------\n");
    sem_post(cache->write);

    return 1;
}

/*
 * read_cache - read the node (if exists) with given uri
 * 
 * Input is the cache-list header, the given uri, the response pointer that will
 * be filled
 * 
 * return -1 when no node is found
 */
int read_cache(Cache cache, char *uri, char *ret_res)
{
    // 我锁
    sem_wait(cache->all);
    cache->reader_cnt++;
    if(cache->reader_cnt == 1) 
    {
        sem_wait(cache->write);
    }
    sem_post(cache->all);

    // 在 cache 中找这个请求对应的节点
    Node node = find_node(cache, uri);
    c_dbgprintf("\n-------------------------------\n");
    c_dbgprintf("    -try reading uri: %s\n", uri);

    // 我解锁
    sem_wait(cache->all);
    cache->reader_cnt--;
    if(cache->reader_cnt == 0) 
    {
        sem_post(cache->write);
    }
    sem_post(cache->all);


    // 如果 cache 中有这个请求对应的节点
    if (node != NULL)
    {
        sem_wait(cache->write);
        memcpy(ret_res, node->res, node->res_size);

        // 最近读的放到列表尾部，即成为了 most recently used
        move_to_tail(cache, node);

        c_dbgprintf("    -reading: %d byte\n", node->res_size);
        c_dbgprintf("-------------------------------\n");

        sem_post(cache->write);
        return node->res_size;
    }

    c_dbgprintf("-------------------------------\n");

    return -1;
}