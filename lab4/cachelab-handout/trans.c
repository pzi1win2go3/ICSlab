/*
* Name:         赵天雨
* ID:           guest458
* school ID:    1100012957
*/

/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"
#include "contracts.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. The REQUIRES and ENSURES from 15-122 are included
 *     for your convenience. They can be removed if you like.
 */

char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, k, l;
    int tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    // for 32 * 32 matrix
    // transpose 8 * 8 block every time
    if (M == 32)
    {
        for (i = 0; i < 32; i += 8)
        {
            for (j = 0; j < 32; j += 8)
            {
                for (k = 0; k < 8; k++)
                {
                    tmp0 = A[i + k][j];
                    tmp1 = A[i + k][j + 1];
                    tmp2 = A[i + k][j + 2];
                    tmp3 = A[i + k][j + 3];
                    tmp4 = A[i + k][j + 4];
                    tmp5 = A[i + k][j + 5];
                    tmp6 = A[i + k][j + 6];
                    tmp7 = A[i + k][j + 7];

                    B[j][i + k] = tmp0;
                    B[j + 1][i + k] = tmp1;
                    B[j + 2][i + k] = tmp2;
                    B[j + 3][i + k] = tmp3;
                    B[j + 4][i + k] = tmp4;
                    B[j + 5][i + k] = tmp5;
                    B[j + 6][i + k] = tmp6;
                    B[j + 7][i + k] = tmp7;
                }
            }
        }
    }

    // for 61 * 67 matrix
    // transpose 8 * 8 block
    else if (M == 61)
    {
        for (i = 0; i < N; i += 8) 
        {
            for (j = 0; j < M; j += 8) 
            {
                for (k = i; k <= i + 3 && k < N; k++)
                {
                    for (l = j; l <= j + 3 && l < M; l++)
                    {
                        tmp0 = A[k][l];
                        B[l][k] = tmp0;
                    }
                }
                for (k = i; k <= i + 3 && k < N; k++)
                {
                    for (l = j + 4; l <= j + 7 && l < M; l++)
                    {
                        tmp0 = A[k][l];
                        B[l][k] = tmp0;
                    }
                }
                for (k = i + 4; k <= i + 7 && k < N; k++)
                {
                    for (l = j; l <= j + 4 && l < M; l++)
                    {
                        tmp0 = A[k][l];
                        B[l][k] = tmp0;
                    }
                }
                for (k = i + 4; k <= i + 7 && k < N; k++)
                {
                    for (l = j + 4; l <= j + 7 && l < M; l++)
                    {
                        tmp0 = A[k][l];
                        B[l][k] = tmp0;
                    }
                }
            }
        }
    }

    // for 64 * 64 matrix
    else
    {
        // first tranpose blocks at diagonal
        for (i = 0; i < 64; i += 8)
        {
            tmp0 = (i + 8) % 64;
            for (k = i; k < i + 8; k++)
            {
                for (l = 0; l < 8; l++)
                {
                    B[k][tmp0 + l] = A[k][l + i];
                }
            }
            for (k = i; k < i + 8; k++)
            {
                for (l = 0; l < 4; l++)
                {
                    B[i + l][k]= B[k][tmp0 + l];
                }
            }
            for (k = i; k < i + 8; k++)
            {
                for (l = 4; l < 8; l++)
                {
                    B[i + l][k]= B[k][tmp0 + l];
                }
            }
        }

        // then tranpose blocks not at diagonal
        for (i = 0; i < N; i += 8) 
        {
            for (j = 0; j < M; j += 8) 
            {
                if (i != j)
                {
                    for (k = i; k < i + 4; k++)
                    { 
                        for (l = j; l < j + 4; l++)
                        {
                            B[l][k] = A[k][l];
                        }
                        if ((i == 0 && j == 56) || (i == 56 && j == 0))
                        {
                            tmp0 = 24;
                            tmp1 = 24;
                        }
                        else if (i == 0 || j == 0)
                        {
                            tmp0 = 56;
                            tmp1 = 56;
                        }
                        else
                        {
                            tmp0 = 0;
                            tmp1 = 0;
                        }
                    }

                    for (k = 0; k < 4; k++)
                        for (l = 4; l < 8; l++)
                            A[tmp0 + k][tmp1 + l] = A[k + i][l + j];

                    for (k = i + 4; k < i + 8; k++)
                        for (l = j; l < j + 4; l++)
                            B[l][k] = A[k][l];

                    for (k = 0; k < 4; k++)
                        for (l = 4; l < 8; l++)
                            B[l + j][i + k] = A[tmp0 + k][tmp1 + l];

                    for (k = i + 4; k < i + 8; k++)
                        for (l = j + 4; l < j + 8;l++)
                            B[l][k] = A[k][l];

                }
            }
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

    ENSURES(is_transpose(M, N, A, B));
}

/*
* basicBlockingTrans - 8 * 8 blocks embeding four 4 * 4 blocks
*/
char basicBlockingTrans_desc[] = "Basic 8*8 blocking transpose";
void basicBlockingTrans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, k, l, tmp;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for (i = 0; i < N; i += 8) 
    {
        for (j = 0; j < M; j += 8) 
        {
            for (k = i; k <= i + 3 && k < N; k++)
            {
                for (l = j; l <= j + 3 && l < M; l++)
                {
                    tmp = A[k][l];
                    B[l][k] = tmp;
                }
            }
            for (k = i; k <= i + 3 && k < N; k++)
            {
                for (l = j + 4; l <= j + 7 && l < M; l++)
                {
                    tmp = A[k][l];
                    B[l][k] = tmp;
                }
            }
            for (k = i + 4; k <= i + 7 && k < N; k++)
            {
                for (l = j; l <= j + 4 && l < M; l++)
                {
                    tmp = A[k][l];
                    B[l][k] = tmp;
                }
            }
            for (k = i + 4; k <= i + 7 && k < N; k++)
            {
                for (l = j + 4; l <= j + 7 && l < M; l++)
                {
                    tmp = A[k][l];
                    B[l][k] = tmp;
                }
            }
        }
    }    

    ENSURES(is_transpose(M, N, A, B));
}

/*
* basicBlockingTrans - 8 * 8 blocks embeding four 4 * 4 blocks
*/
char optimizedBlockingTrans_desc[] = "Optimized 8*8 blocking transpose";
void optimizedBlockingTrans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, k, l;
    int tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    // for 32 * 32 matrix
    // transpose 8 * 8 block every time
    if (M == 32)
    {
        for (i = 0; i < 32; i += 8)
        {
            for (j = 0; j < 32; j += 8)
            {
                for (k = 0; k < 8; k++)
                {
                    tmp0 = A[i + k][j];
                    tmp1 = A[i + k][j + 1];
                    tmp2 = A[i + k][j + 2];
                    tmp3 = A[i + k][j + 3];
                    tmp4 = A[i + k][j + 4];
                    tmp5 = A[i + k][j + 5];
                    tmp6 = A[i + k][j + 6];
                    tmp7 = A[i + k][j + 7];

                    B[j][i + k] = tmp0;
                    B[j + 1][i + k] = tmp1;
                    B[j + 2][i + k] = tmp2;
                    B[j + 3][i + k] = tmp3;
                    B[j + 4][i + k] = tmp4;
                    B[j + 5][i + k] = tmp5;
                    B[j + 6][i + k] = tmp6;
                    B[j + 7][i + k] = tmp7;
                }
            }
        }
    }

    // for 61 * 67 matrix
    // transpose 8 * 8 block
    else if (M == 61)
    {
        for (i = 0; i < N; i += 8) 
        {
            for (j = 0; j < M; j += 8) 
            {
                for (k = i; k <= i + 3 && k < N; k++)
                {
                    for (l = j; l <= j + 3 && l < M; l++)
                    {
                        tmp0 = A[k][l];
                        B[l][k] = tmp0;
                    }
                }
                for (k = i; k <= i + 3 && k < N; k++)
                {
                    for (l = j + 4; l <= j + 7 && l < M; l++)
                    {
                        tmp0 = A[k][l];
                        B[l][k] = tmp0;
                    }
                }
                for (k = i + 4; k <= i + 7 && k < N; k++)
                {
                    for (l = j; l <= j + 4 && l < M; l++)
                    {
                        tmp0 = A[k][l];
                        B[l][k] = tmp0;
                    }
                }
                for (k = i + 4; k <= i + 7 && k < N; k++)
                {
                    for (l = j + 4; l <= j + 7 && l < M; l++)
                    {
                        tmp0 = A[k][l];
                        B[l][k] = tmp0;
                    }
                }
            }
        }
    }

    // for 64 * 64 matrix
    else
    {
        // first tranpose blocks at diagonal
        for (i = 0; i < 64; i += 8)
        {
            tmp0 = (i + 8) % 64;
            for (k = i; k < i + 8; k++)
            {
                for (l = 0; l < 8; l++)
                {
                    B[k][tmp0 + l] = A[k][l + i];
                }
            }
            for (k = i; k < i + 8; k++)
            {
                for (l = 0; l < 4; l++)
                {
                    B[i + l][k]= B[k][tmp0 + l];
                }
            }
            for (k = i; k < i + 8; k++)
            {
                for (l = 4; l < 8; l++)
                {
                    B[i + l][k]= B[k][tmp0 + l];
                }
            }
        }

        // then tranpose blocks not at diagonal
        for (i = 0; i < N; i += 8) 
        {
            for (j = 0; j < M; j += 8) 
            {
                if (i != j)
                {
                    for (k = i; k < i + 4; k++)
                    { 
                        for (l = j; l < j + 4; l++)
                        {
                            B[l][k] = A[k][l];
                        }
                        if ((i == 0 && j == 56) || (i == 56 && j == 0))
                        {
                            tmp0 = 24;
                            tmp1 = 24;
                        }
                        else if (i == 0 || j == 0)
                        {
                            tmp0 = 56;
                            tmp1 = 56;
                        }
                        else
                        {
                            tmp0 = 0;
                            tmp1 = 0;
                        }
                    }

                    for (k = 0; k < 4; k++)
                        for (l = 4; l < 8; l++)
                            A[tmp0 + k][tmp1 + l] = A[k + i][l + j];

                    for (k = i + 4; k < i + 8; k++)
                        for (l = j; l < j + 4; l++)
                            B[l][k] = A[k][l];

                    for (k = 0; k < 4; k++)
                        for (l = 4; l < 8; l++)
                            B[l + j][i + k] = A[tmp0 + k][tmp1 + l];

                    for (k = i + 4; k < i + 8; k++)
                        for (l = j + 4; l < j + 8;l++)
                            B[l][k] = A[k][l];

                }
            }
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
	/* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 
    registerTransFunction(basicBlockingTrans, basicBlockingTrans_desc);
    registerTransFunction(optimizedBlockingTrans, optimizedBlockingTrans_desc);

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
			if (A[i][j] != B[j][i]) {
				return 0;
			}
		}
    }
    return 1;
}

