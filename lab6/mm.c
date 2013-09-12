/*
 * mm.c
 *
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
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
# define dbg_printf(...)
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

#define MAX(a, b) ((a) > (b) ? (a) : (b))
/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8
#define WSIZE     4
#define DSIZE     8
#define CHUNKSIZE 16
#define MAX_HEAP_SIZE (1<<32-1)

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(p) (((size_t)(p) + (ALIGNMENT-1)) & ~0x7)
#define SIZE_T_SIZE (ALIGN(sizeof(size_t)))

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc) ((size) | (alloc))

#define GET(p)        (*(unsigned int *)(p))
#define PUT(p, val)   (*(unsigned int *)(p) = (val))
#define PUTEXTRA(p, val) (*(unsigned int *)(p) = (val))

#define GET_SIZE(p)   (GET(p) & ~0x7)
#define GET_ALLOC(p)  (GET(p) & 0x1)

#define HDRP(bp)      ((void *)(bp) - WSIZE)
#define FTRP(bp)      ((void *)(bp) + GET_SIZE(HDRP(bp)) - 2*WSIZE)

#define NEXT_FREE(bp) ((void *)(*(unsigned int *)(bp) + mem_heap_lo()))
#define PREV_FREE(bp) ((void *)(*(unsigned int *)((void *)(bp) + WSIZE) + mem_heap_lo()))

#define NEXT_BLKP(bp) ((void *)(bp) + GET_SIZE(HDRP(bp)))
#define PREV_BLKP(bp) ((void *)(bp) - GET_SIZE(((void *)(bp) - 2*WSIZE)))

#define GET_PREV_ALLOC(bp) (GET(HDRP(bp)) & 0x2)

static inline void SET_PREV_ALLOC(void *bp) {
    unsigned int header = GET(HDRP(bp));
    header |= 0x2;
    PUT(HDRP(bp), header);
}

static inline void CANCEL_PREV_ALLOC(void *bp) {
    unsigned int header = GET(HDRP(bp));
    header &= ~0x2;
    PUT(HDRP(bp), header);
}

static inline void *place(void *bp, size_t size);
#define PTR_SIZE 4
#define LIST_NUMBER 13

typedef unsigned int p32;
static int count = 0;
static void *last_free_block;;

static void printHeap();
static void *heap_listp;
static void *free_list[14];
static void print_free() {
    int i;
    for (i = 0; i <= LIST_NUMBER; i++) {
        dbg_printf("[%2d]%p\n", i, free_list[i]);
    }
}

static inline int get_box_number(unsigned int size) {
   int n = 0;  
   unsigned int a = 1;  
   while (a < size)  
   {  
       a *= 2;  
       n++;  
       if (n == LIST_NUMBER)  
           break;
   }  
   return n;
}

static inline void add_free(void *bp) {
    CANCEL_PREV_ALLOC(NEXT_BLKP(bp));
    int size = GET_SIZE(HDRP(bp));
    size = GET_SIZE(HDRP(bp));
    int n = get_box_number(size);
    // print_free();
    dbg_printf("Add free of size %d to box %d\n", size, n);

    void *next = free_list[n];

    PUT(bp, (size_t)next);
    if (next) {
        PUT(next + WSIZE, (size_t)bp);
    }

    PUT(bp + WSIZE, 0);
    free_list[n] = bp;
    if (GET_SIZE(HDRP(NEXT_BLKP(bp))) == 0) {
        last_free_block = bp;
    }

    dbg_printf("next free is %p\n", NEXT_FREE(bp));
}

static inline void delete_free(void *bp) {
    CANCEL_PREV_ALLOC(NEXT_BLKP(bp));
    int size = GET_SIZE(HDRP(bp));
    int n = get_box_number(size);
    SET_PREV_ALLOC(NEXT_BLKP(bp));

    // print_free();
    dbg_printf("Delete free of size %d from box %d\n", size, n);

    int *prevp = PREV_FREE(bp);
    int *nextp = NEXT_FREE(bp);
    int next = *(int *)(bp);
    int prev = *(int *)(bp+WSIZE);

    if (next) {
        nextp[1] = prev;
    }

    if (prev) {
        prevp[0] = next;
    } else {
        if (next)
            free_list[n] = (void *)nextp;
        else
            free_list[n] = NULL;
    } 
    if (GET_SIZE(HDRP(NEXT_BLKP(bp))) == 0) {
        last_free_block = NULL;
    }
}

static inline void *coalesce(void *bp)  
{  
    size_t prev_alloc = GET_PREV_ALLOC(bp);
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
    size_t size = GET_SIZE(HDRP(bp));
    dbg_printf("prev_alloc=%ld\n", prev_alloc);
    if (prev_alloc && next_alloc) {
        add_free(bp);
        return bp;
    }
    else if (prev_alloc && !next_alloc) {
    dbg_printf("3\n");

        size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
        int prev_alloc = GET_PREV_ALLOC(bp);
        delete_free(NEXT_BLKP(bp));
        PUTEXTRA(HDRP(bp), PACK(size, 0));
        PUTEXTRA(FTRP(bp), PACK(size, 0));
        if (prev_alloc)
            SET_PREV_ALLOC(bp);
        add_free(bp);
    }
    else if (!prev_alloc && next_alloc) {
        dbg_printf("Merge with previous free block\n");
        size += GET_SIZE(FTRP(PREV_BLKP(bp)));
        int prev_alloc = GET_PREV_ALLOC(PREV_BLKP(bp));
        delete_free(PREV_BLKP(bp));
        PUTEXTRA(FTRP(bp), PACK(size, 0));
        PUTEXTRA(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
        if (prev_alloc)
            SET_PREV_ALLOC(bp);
        add_free(bp);
    }
    else {
        dbg_printf("5\n");

        size += GET_SIZE(FTRP(PREV_BLKP(bp))) +
                GET_SIZE(HDRP(NEXT_BLKP(bp)));
        int prev_alloc = GET_PREV_ALLOC(PREV_BLKP(bp));
        delete_free(PREV_BLKP(bp));
        delete_free(NEXT_BLKP(bp));
        PUTEXTRA(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        PUTEXTRA(FTRP(NEXT_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
        if (prev_alloc)
            SET_PREV_ALLOC(bp);
        add_free(bp);
    }
    return bp;
}

static inline void *extend_heap2(size_t size) {
    void *bp;
    if (last_free_block) {
        size_t extendsize = ALIGN(size - GET_SIZE(HDRP(last_free_block)));
        // printf("Last free has %d\n", GET_SIZE(HDRP(last_free_block)));
        if ((long)(bp = mem_sbrk(extendsize)) == -1)
            return NULL;
        
        bp = last_free_block;
        delete_free(last_free_block);
        assert(last_free_block == NULL);

        PUT(HDRP(bp), PACK(GET_SIZE(HDRP(bp)) + extendsize, 1));
        SET_PREV_ALLOC(bp);

        /* 恢复 epilogue */
        PUTEXTRA(HDRP(NEXT_BLKP(bp)), PACK(0, 1));
        SET_PREV_ALLOC(NEXT_BLKP(bp));
        // printf("Heap extend for %ld, totally %ld now.\n", size, mem_heapsize());

        return bp;
    }

    dbg_printf("%ld\n", size);
    if ((long)(bp = mem_sbrk(size)) == -1)
        return NULL;

    int prev_alloc = GET_PREV_ALLOC(bp);
    PUTEXTRA(HDRP(bp), PACK(size, 1));
    if (prev_alloc) {
        SET_PREV_ALLOC(bp);
        dbg_printf("Prev is allocate\n");
    }
    PUTEXTRA(HDRP(NEXT_BLKP(bp)), PACK(0, 1));
    SET_PREV_ALLOC(NEXT_BLKP(bp));

    dbg_printf("Heap extended\n");
    // printf("Heap extend for %ld, totally %ld now.\n", size, mem_heapsize());

    return bp;
}

static inline void *find_fit(size_t asize) {
    int n = get_box_number(asize), next;
    dbg_printf("Goint to find %ld from box %d\n", asize, n);
    void *bp = free_list[n];
    if (bp) {
        while (bp) {
            if (bp && GET_SIZE(HDRP(bp)) >= asize) {
                return bp;
            }
            next = *(int *)(bp);
            if (next)
                bp = NEXT_FREE(bp);
            else
                bp = NULL;
        }
    }
    // dbg_printf("No more size in class %d\next", n);
    while ((++n) <= LIST_NUMBER) {
        bp = free_list[n];
        while (bp) {
            if (bp && GET_SIZE(HDRP(bp)) >= asize) {
                return bp;
            }
            next = *(int *)(bp);
            if (next)
                bp = NEXT_FREE(bp);
            else
                bp = NULL;
        }
    }

    return NULL;
}

static inline void *place(void *bp, size_t size) {
    dbg_printf("Try to place\n");
    size_t remainsize;
    size_t original_size = GET_SIZE(HDRP(bp));

    remainsize = original_size - size;
    
    if (remainsize >= CHUNKSIZE) {
        dbg_printf("Try to split\n");
        dbg_printf("%p\n", NEXT_FREE(bp));
        delete_free(bp);
        int prev_alloc = GET_PREV_ALLOC(bp);
        PUTEXTRA(HDRP(bp), PACK(size, 1));
        PUTEXTRA(FTRP(bp), PACK(size, 1));
        if (prev_alloc)
            SET_PREV_ALLOC(bp);
        PUTEXTRA(HDRP(NEXT_BLKP(bp)), PACK(remainsize, 0));
        PUTEXTRA(FTRP(NEXT_BLKP(bp)), PACK(remainsize, 0));
        SET_PREV_ALLOC(NEXT_BLKP(bp));
        add_free(NEXT_BLKP(bp));
        dbg_printf("Splitted\n");
    } else {
        int prev_alloc = GET_PREV_ALLOC(bp);
        PUTEXTRA(HDRP(bp), PACK(original_size, 1));
        PUTEXTRA(FTRP(bp), PACK(original_size, 1));
        if (prev_alloc)
            SET_PREV_ALLOC(bp);
        SET_PREV_ALLOC(NEXT_BLKP(bp));
        delete_free(bp);
        dbg_printf("Keep Original %ld\n", original_size);

    }
    dbg_printf("Placed\n");
    return bp;
}

static int aligned(const void *p);
/*
 * Initialize: return -1 on error, 0 on success.
 */
int mm_init(void) {
    if ((heap_listp = mem_sbrk(4*WSIZE)) == (void *)-1) {
        return -1;
    } 
    
    int i;
    for (i = 0; i <= LIST_NUMBER; i++) {
        free_list[i] = NULL;
    }
    PUTEXTRA(heap_listp, 0);
    PUTEXTRA(heap_listp + WSIZE, PACK(2*WSIZE, 1));
    PUTEXTRA(heap_listp + 2*WSIZE, PACK(2*WSIZE, 1));
    PUTEXTRA(heap_listp + 3*WSIZE, PACK(0, 1));
    SET_PREV_ALLOC(heap_listp + 4*WSIZE);

    heap_listp += 2*WSIZE;
    last_free_block = NULL;
    return 0;
}

/*
 * malloc
 */
void *malloc (size_t size) {
    size_t asize;
    size_t extendsize;
    void *bp;
    count++;

    if (size == 0) return NULL;

    asize = ALIGN(MAX(CHUNKSIZE, WSIZE+size));

    if ((bp = find_fit(asize)) != NULL) {
        dbg_printf("Find fit of size %d\n", GET_SIZE(HDRP(bp)));
        place(bp, asize);
        return bp;
    }
    dbg_printf("Not find fit\n");
    // printf("allocate for %ld. AJUSTED=(%ld). ---- ", size, asize);
    extendsize = ALIGN(MAX(asize, CHUNKSIZE));
    if (size > 10000) {
        // printHeap();
    }
    if ((bp = extend_heap2(extendsize)) == NULL)
        return NULL;

    return bp;
}

/*
 * free
 */
void free(void *ptr)  
{  
    count++;
  dbg_printf("free block of size %d\n", GET_SIZE(HDRP(ptr)));
  if (ptr == NULL) return;
   size_t size = GET_SIZE(HDRP(ptr));  

   int prev_alloc = GET_PREV_ALLOC(ptr);
   PUTEXTRA(HDRP(ptr), PACK(size, 0));  
   PUTEXTRA(FTRP(ptr), PACK(size, 0));
   CANCEL_PREV_ALLOC(NEXT_BLKP(ptr));
   if (prev_alloc)
        SET_PREV_ALLOC(ptr);

   coalesce(ptr);  
}  

/*
 * realloc - you may want to look at mm-naive.c
 */
void *realloc(void *oldptr, size_t size) {
    size_t oldsize;
    void *newptr;

    if (size == 0) {
        free(oldptr);
        return 0;
    }

    if (oldptr == NULL) {
        return malloc(size);
    }

    newptr = malloc(size);

    if (!newptr) return 0;

    oldsize = GET_SIZE(HDRP(oldptr));
    if (size < oldsize) oldsize = size;
    memcpy(newptr, oldptr, oldsize);

    free(oldptr);

    return newptr;
}

/*
 * calloc - you may want to look at mm-naive.c
 * This function is not tested by mdriver, but it is
 * needed to run the traces.
 */
void *calloc (size_t nmemb, size_t size) {
  size_t bytes = nmemb * size;
  void *newptr;

  newptr = malloc(bytes);
  memset(newptr, 0, bytes);

  return newptr;
}


/*
 * Return whether the pointer is in the heap.
 * May be useful for debugging.
 */
static int in_heap(const void *p) {
    return p <= mem_heap_hi() && p >= mem_heap_lo();
}

/*
 * Return whether the pointer is aligned.
 * May be useful for debugging.
 */
static int aligned(const void *p) {
    return (size_t)ALIGN(p) == (size_t)p;
}

static int getFreeCount1() {
    void *bp = NEXT_BLKP(heap_listp);
    int cnt;

    while (GET_SIZE(HDRP(bp)) != 0) {
        if (GET_ALLOC(HDRP(bp)) == 0) {
            cnt++;
        }
        bp = NEXT_BLKP(bp);
    }

    return cnt;
}

static int getFreeCount2() {
    int cnt = 0;
    int i;
    for (i = 0; i <= LIST_NUMBER; i++) {
        void *bp = free_list[i];
        while (bp) {
            cnt++;
            int next = *(int *)(bp);
            if (next == 0) {
                break;
            } else {
                bp = NEXT_FREE(bp);
            }
        }
    }
    return cnt;
}

static void printHeap() {
    void *bp = heap_listp;
    printf("\n************************ HEAP ************************\n");
    while (GET_SIZE(HDRP(bp)) != 0) {
        printf("(%p)[H:(%d/%d/%d)", bp, GET_SIZE(HDRP(bp)), GET_PREV_ALLOC(bp), GET_ALLOC(HDRP(bp)));
        printf("---");
        printf("F:(%d/%d)]\n", GET_SIZE(HDRP(bp)), GET_ALLOC(HDRP(bp)));
        bp = NEXT_BLKP(bp);
    }
    printf("[X/%dEP]\n", GET_PREV_ALLOC(mem_sbrk(0)));
    printf("************************ HEAP ************************\n");
}

/*
 * mm_checkheap
 */
void mm_checkheap(int verbose) {
    return;
    verbose = 1;
    printHeap();
    size_t blocksize;
    void *bp = heap_listp;
    void *epilogue = (void *)(mem_sbrk(0));
    // Check the heap
    // Check epilogue and prologue blocks
    assert(GET_SIZE(HDRP(heap_listp)) == WSIZE*2);
    assert(GET_ALLOC(HDRP(heap_listp)) == 1);
    assert(GET_ALLOC(HDRP(epilogue)) == 1);
    assert(GET_SIZE(HDRP(epilogue)) == 0);
    int cnt = 0;
    if (getFreeCount1() != getFreeCount2()) {
        dbg_printf("%d %d", getFreeCount1(), getFreeCount2());
        print_free();
    }
    assert(getFreeCount1() == getFreeCount2());
    while ((blocksize = GET_SIZE(HDRP(bp))) != 0) {
        // printf("%p\n", bp);
        cnt++;

        assert(aligned(bp));
        assert(in_heap(bp));
        if (GET_ALLOC(HDRP(bp)) == 0) {
            assert(GET_SIZE(HDRP(bp)) == GET_SIZE(FTRP(bp)));
            assert(GET_ALLOC(HDRP(bp)) == GET_ALLOC(FTRP(bp)));
        }
        assert(GET_SIZE(HDRP(bp)) % ALIGNMENT == 0);
        assert(GET_SIZE(HDRP(bp)) >= CHUNKSIZE || bp == heap_listp);
        if (GET_ALLOC(HDRP(bp)) == 0) {
            assert(GET_PREV_ALLOC(bp) != 0);
            // assert(GET_ALLOC(NEXT_BLKP(bp)) != 0);
            // assert(GET_ALLOC(FTRP(PREV_BLKP(bp))) == 1);
            // if (NEXT_FREE(bp) != NULL) {
            //     assert(PREV_FREE(NEXT_FREE(bp)) == bp); 
            // }
            // assert(PREV_FREE(bp) == NULL || PREV_FREE(bp) >= (void *)mem_heap_lo());
            // assert(NEXT_FREE(bp) == NULL || NEXT_FREE(bp) <= (void *)mem_heap_hi());
        }
            // assert(PREV_BLKP(NEXT_BLKP(bp)) == bp);
        // assert((mem_heapsize()) < ((size_t)(MAX_HEAP_SIZE)));
        bp = NEXT_BLKP(bp);
    }
    dbg_printf("Check passed\n");
}
