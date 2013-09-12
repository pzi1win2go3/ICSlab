/*
 * mm.c
 *
 *  ID: guest458 Name: 赵天雨
 *
 * NOTE TO STUDENTS: SEGREGATED LIST + LIFO
 *                   --- Feature: 1. use offset instead of absolute addr in presentation(list head, pred, succ).
 *                                2. when mallocing, if found a free block not big enough, but it's the last block in heap, 
 *                                   just expand it and use it.
 *                                3. nothing
 */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "mm.h"
#include "memlib.h"

/* If you want debugging output, use the following macro.  When you hand
 * in, remove the #define DEBUG line. */
// #define DEBUG
#ifdef DEBUG
# define dbg_printf(...) printf(__VA_ARGS__)
#else
# define dbg_printf(...)
#endif

/* do not change the following! */
#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif /* def DRIVER */

/* marcos from book */
#define HSIZE       4       // half word size
#define WSIZE       8       // word size    
#define PACK(size, alloc)  ((size) | (alloc))                           //puts size and allocated byte into 4 bytes
#define GET(p)          (unsigned long)(*(unsigned int *)(p))           //read word at address p
#define PUT(p, val)     (*(unsigned int *)(p) = (val))                  //write word at address p
#define GET_SIZE(p)     (*(unsigned int *)(p) & ~0x7)                   //extracts size from 4 byte header/footer
#define GET_ALLOC(p)    (*(unsigned int *)(p) & 0x1)                    //extracts allocated byte from 4 byte header/footer
#define HDRP(bp)       ((char *)(bp) - HSIZE * 3)                                   //get ptr's header address
#define FTRP(bp)       ((char *)(bp) + GET_SIZE(HDRP(bp)) - HSIZE * 4)              //get ptr's footer address
#define PRED(bp)       ((char *)(bp) - HSIZE * 2)
#define SUCC(bp)       ((char *)(bp) - HSIZE * 1)      
#define NEXT_BLKP(bp)  ((char *)(bp) + (unsigned long)GET_SIZE((char *)(bp) - HSIZE * 3))     //next block
#define PREV_BLKP(bp)  ((char *)(bp) - (unsigned long)GET_SIZE((char *)(bp) - HSIZE * 4))     //prev block
#define REAL_ADDR(offset)   (char *)((unsigned long)offset + base_addr)

#define CLASSES_NUM 21
#define INF 0x7FFFFFF8
#define EXTRA (4 * HSIZE)                   // size of (header + footer + succ + pred)

static char *heap_listp = 0;                // ptr to first block
static unsigned long base_addr = 0;
static char *prologue_blk = 0;
static size_t class_size[CLASSES_NUM] = 
                            {8, 16, 24, 32, 64, 
                             128, 256, 512, 768, 1280, 
                             2304, 3328, 4352, 6400, 8196, 
                             16392, 24588, 32784, 65568, 131136, INF};

static inline void *coalesce(void *bp);
static inline void insert(char *cur_blk, size_t asize);
static inline void print_blk(char *cur_blk);
static inline void destroy_relationship(char *cur_blk);
static inline int find_class(size_t asize);

/*
 * Initialize: return -1 on error, 0 on success.
 */
int mm_init(void) 
{
    // We have a set of pointers at the beginning of heap.
    // Each pointer points to the first free block of its size class.
    // Each pointer points to NULL as default
    if ((heap_listp = mem_sbrk(CLASSES_NUM * HSIZE)) == (void *)-1)
        return -1;
    for (int i = 0; i < CLASSES_NUM; i++)
    {
        PUT(heap_listp + i * HSIZE, 0);
    }

    // Then we have a prologue block
    // to avoid troubles when coalesce
    if ((prologue_blk = mem_sbrk(EXTRA)) == (void *)-1)
        return -1;
    prologue_blk += 3 * HSIZE;
    PUT(HDRP(prologue_blk), PACK(EXTRA, 1));
    PUT(FTRP(prologue_blk), PACK(EXTRA, 1));
    prologue_blk -= 2 * HSIZE;
    base_addr = (unsigned long)prologue_blk;

    return 0;
}

/*
 * malloc
 */
void *malloc (size_t size) 
{
    // mm_checkheap(2);

    int cur_index = 0;
    size_t asize;
    unsigned long mhi = (unsigned long)mem_heap_hi();

    // calculate aligned and minimum size
    if (size == 0)
        return 0;
    asize = WSIZE * ((size + (WSIZE - 1)) / WSIZE) + 2 * HSIZE;

    // find class of suitable size
    cur_index = find_class(asize);

    // search free block in different lists for appropriate free block
    char *free_blk = 0;
    while (cur_index < CLASSES_NUM)
    {
        free_blk = REAL_ADDR(GET(heap_listp + cur_index * HSIZE));
        
        // search appropriate free block in cur_index list
        while (free_blk != (char *)base_addr)
        {
            size_t free_blk_size = GET_SIZE(HDRP(free_blk));

            // if free_blk is too small, and it's not the last block in heap
            // ---- see next block
            if (free_blk_size < asize && (unsigned long)NEXT_BLKP(free_blk) < mhi)
            {
                free_blk = REAL_ADDR(GET(SUCC(free_blk)));
                continue;
            }

            // if free_blk is too small, but it's the last block in heap
            // ---- then we can just expand this free_blk to asize and choose it
            else if (free_blk_size < asize)
            {
                // Destroy its relationship with other block, make it independent
                // So that it'll be convenient to use this free block
                destroy_relationship(free_blk);

                // get the size we want to expand
                size_t delta = asize - free_blk_size;
                if (mem_sbrk(delta) == (void *)-1)
                    return NULL;
            }

            // if free_blk is big enough to split
            // ---- split it
            else if (free_blk_size - asize >= 5 * HSIZE)
            {
                // Destroy its relationship with other block, make it independent
                // So that it'll be convenient to insert new free block
                destroy_relationship(free_blk);

                // I'M SURE new_blk_size IS ALIGNED TO WSIZE
                size_t new_blk_size = free_blk_size - asize;
                // we do spliting here!
                char *new_blk = free_blk + asize;
                insert(new_blk, new_blk_size);
            }

            // if free_blk is not big enough to split
            // ---- use the entire free block (that is free_blk)
            else
            {
                // Destroy its relationship with other block, make it independent
                // So that it'll be convenient to use this free block
                destroy_relationship(free_blk);

                asize = free_blk_size;
            }

            // turns free block into allocated block
            PUT(HDRP(free_blk), PACK(asize, 1));
            PUT(FTRP(free_blk), PACK(asize, 1));

            // found and return
            return (void *)(free_blk - 2 * HSIZE);
        }
        cur_index++;
    }

    // found no appropriate free block, we need to mem_sbrk
    char *new_blk = 0;

    if ((new_blk = mem_sbrk(asize)) == (void *)-1)
        return 0;

    new_blk += (3 * HSIZE);
    PUT(HDRP(new_blk), PACK(asize, 1));
    PUT(FTRP(new_blk), PACK(asize, 1));

    return (void *)(new_blk - 2 * HSIZE);
}

/*
 * free
 */
void free (void *ptr) 
{
    // mm_checkheap(2);

    if (ptr == 0)
    {
        dbg_printf("-ARE YOU KIDDING ME?\n\n");
        return;
    }

    // because allocated block doesn't have pred and succ,
    // it has 2 HSIZE more payload
    // ---- here we need to get the right point by taking space of (pred + succ) into account
    ptr += 2 * HSIZE; 

    coalesce(ptr);

    dbg_printf("-successfully free!\n\n");
}

/*
 * realloc - you may want to look at mm-naive.c
 */
void *realloc(void *oldptr, size_t size)
{
    size_t oldsize;
    void *newptr;
    size_t asize;

    /* If size == 0 then this is just free, and we return 0. */
    if(size == 0) 
    {
      free(oldptr);
      return 0;
    }

    asize = WSIZE * ((size + (WSIZE - 1)) / WSIZE) + 2 * HSIZE;

    /* If oldptr is 0, then this is just malloc. */
    if(oldptr == 0) 
    {
      return malloc(asize);
    }

    newptr = malloc(asize);

    /* If realloc() fails the original block is left untouched  */
    if(!newptr) 
    {
      return 0;
    }

    // Copy the old data.
    // because allocated block doesn't have pred and succ,
    // it has 2 HSIZE more payload
    // ---- here we need to get the right point by taking space of (pred + succ) into account
    oldsize = GET_SIZE(HDRP(oldptr + 2 * HSIZE));
    if(asize < oldsize) 
        oldsize = asize;
    memcpy(newptr, oldptr, oldsize);
    /* Free the old block. */
    free(oldptr);

    return newptr;
}

/*
 * calloc - you may want to look at mm-naive.c
 * This function is not tested by mdriver, but it is
 * needed to run the traces.
 */
void *calloc (size_t nmemb, size_t size) 
{
    size_t bytes = nmemb * size;
    void *newptr;

    newptr = malloc(bytes);
    memset(newptr, 0, bytes);

    return newptr;
}

static void *coalesce(void *bp)
{
    char *cur_blk = (char *)bp;
    size_t cur_size = GET_SIZE(HDRP(cur_blk));

    // FIRST -------- coalesce previous blk
    char *prev_of_cur = PREV_BLKP(cur_blk);
    if (GET_ALLOC(HDRP(prev_of_cur)) == 0)
    {
        // make prev_of_cur an independent free block
        destroy_relationship(prev_of_cur);

        // expand cur_blk
        cur_blk = prev_of_cur;
        cur_size += GET_SIZE(HDRP(prev_of_cur));
    }

    // SECOND -------- coalesce next blk
    char *next_of_cur = NEXT_BLKP(cur_blk);
    if ((unsigned long)next_of_cur < (unsigned long)mem_heap_hi() && GET_ALLOC(HDRP(next_of_cur)) == 0)
    {
        // make next_of_cur an independent free block
        destroy_relationship(next_of_cur);
        
        // expand cur_blk
        cur_size += GET_SIZE(HDRP(next_of_cur));
    }

    // ----- FINALLY insert new blk to suitable free list
    insert(cur_blk, cur_size);
    return cur_blk;
}

/*
*  Insert a free block to suitable class,
*  notes: 1. it's independent at first, that is to say, we have already destroy_relationship(cur_blk)
*         2. it'll be the first free block in its class
*/
static void insert(char *cur_blk, size_t asize)
{
    // FIRST find the class to insert in
    int class_index = 0;
    class_index = find_class(asize);

    // see if there has already been any free block in this class
    // if there is, we need to modify the relationship of the old first free block
    char *old_first = REAL_ADDR(GET(heap_listp + class_index * HSIZE));

    // here we modify cur_blk's info
    PUT(HDRP(cur_blk), PACK(asize, 0));
    PUT(FTRP(cur_blk), PACK(asize, 0));
    PUT(heap_listp + class_index * HSIZE, (unsigned int)((unsigned long)cur_blk - base_addr));
    PUT(PRED(cur_blk), 0);
    PUT(SUCC(cur_blk), 0);

    // here we modify the relationship of the old first free block
    if (old_first != (char *)base_addr)
    {
        PUT(PRED(old_first), (unsigned int)((unsigned long)cur_blk - base_addr));
        PUT(SUCC(cur_blk), (unsigned int)((unsigned long)old_first - base_addr));
    }
}

/*
*  Destroy cur_blk's relationship with -1.heap_listp -2.pred -3.succ
*  note: cur_blk is a free block
*/
static void destroy_relationship(char *cur_blk)
{
    char *pred = (char *)(REAL_ADDR(GET(PRED(cur_blk))));
    char *succ = (char *)(REAL_ADDR(GET(SUCC(cur_blk))));

    // when cur_blk is the first free block
    if (pred == (char *)base_addr)
    {
        size_t cur_size = GET_SIZE(HDRP(cur_blk));
        int cur_index = find_class(cur_size);

        PUT(heap_listp + cur_index * HSIZE, (unsigned int)((unsigned long)succ - base_addr));

        if (succ != (char *)base_addr)
        {
            PUT(PRED(succ), 0);
        }
    }
    // when cur_blk is not the first free block
    else
    {
        PUT(SUCC(pred), (unsigned int)(unsigned long)succ - base_addr);

        if (succ != (char *)base_addr)
        {
            PUT(PRED(succ), (unsigned int)(unsigned long)pred - base_addr);
        }
    }
}

/*
*  Find suitable class according to asize
*/
static int find_class(size_t asize)
{
    for (int i = 0; i < CLASSES_NUM; i++)
    {
        if (asize <= class_size[i] + EXTRA)
        {
            return i;
        }
    }

    // never reach here
    return CLASSES_NUM;
}

/*
 * mm_checkheap
 */
void mm_checkheap(int verbose) 
{
    // this method prints free blocks of each class
    if (verbose == 1)
    {
        dbg_printf("\n-----------------------------------------------------\n");
        for (int i = 0; i < CLASSES_NUM; i++)
        {
            dbg_printf(" Class: %d\n", i + 1);
            if (REAL_ADDR(GET(heap_listp + i * HSIZE)) != (char *)base_addr)
            {
                char *cur_blk = REAL_ADDR(GET(heap_listp + i * HSIZE));
                while (1)
                {
                    print_blk(cur_blk);

                    if (REAL_ADDR(GET(SUCC(cur_blk))) == (char *)base_addr)
                        break;
                    cur_blk = REAL_ADDR(GET(SUCC(cur_blk)));
                } 
            }
        }
    }
    // this method prints all blocks in heap sequentially
    else if (verbose == 2)
    {
        dbg_printf("\n-----------------------------------------------------\n");
        char *cur_blk = prologue_blk + 2 * HSIZE;

        while (1)
        {
            print_blk(cur_blk);
            if ((unsigned long)NEXT_BLKP(cur_blk) > (unsigned long)mem_heap_hi())
                break;
            else
                cur_blk = (char *)NEXT_BLKP(cur_blk);
        }
    }
}

static void print_blk(char *cur_blk)
{
    cur_blk = cur_blk;
    dbg_printf("\n    address:   %d\n", (unsigned long)cur_blk);
    dbg_printf("    hdr-size:  %d\n", GET_SIZE(HDRP(cur_blk)));
    dbg_printf("    hdr-alloc: %d\n", GET_ALLOC(HDRP(cur_blk)));
    dbg_printf("    ftr-size:  %d\n", GET_SIZE(FTRP(cur_blk)));
    dbg_printf("    ftr-alloc: %d\n", GET_ALLOC(FTRP(cur_blk)));
    if (GET_ALLOC(HDRP(cur_blk)) == 0)
    {
        dbg_printf("    pred:      %d\n", (unsigned long)REAL_ADDR(GET(PRED(cur_blk))));
        dbg_printf("    succ:      %d\n", (unsigned long)REAL_ADDR(GET(SUCC(cur_blk))));
    }
    dbg_printf("    heap_end:  %d\n", (unsigned long)(mem_heap_hi() + 1));
    dbg_printf("****************************\n");
}

/* thx god finally i have a girlfriend */