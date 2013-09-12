#include "csapp.h"

// Marcos for cache
#define MAX_CACHE_SIZE (1 << 20)
#define MAX_OBJECT_SIZE (100 << 10)

typedef struct Node * Node;
struct Node
{
    Node next;
    char *uri;
    char *res;
    int res_size;
};

typedef struct Cache * Cache;
struct Cache
{
    struct Node * head;
    struct Node * tail;
    int cached_size;
    int left_size;
    sem_t * all;
    sem_t * write;
    int reader_cnt;
};


Cache init_cache();
Node new_node(char *uri, char *res, int res_size);
Node find_node(Cache cache, char *uri);
int evict_node(Cache cache, int res_size);
int free_head(Cache cache);
int move_to_tail(Cache cache, Node node);
int write_cache(Cache cache, char *uri, char *res, int res_size);
int read_cache(Cache cache, char *uri, char *ret_res);
