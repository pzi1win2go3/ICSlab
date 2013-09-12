
/*
* Name: 			赵天雨
* ID: 				guest458
* school ID: 	1100012957
*/
#include "cachelab.h"
#include <getopt.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>


extern char *optarg;
const char *optString = "hvs:E:b:t:";

struct Cache
{
	int valid;
	int visited;
	int tag;
}cache[64];



unsigned s2bin(char *trace)
{
	unsigned bin = 0;
	int len = strlen(trace);
	for (int i = 0; i < len; i++)
	{
		bin *= 16;
		if (isdigit(trace[i]))
			bin += (trace[i] - '0');
		else
			bin += (trace[i] - 'a' + 10);
	}
	return bin;
}

int main(int argc, char **argv)
{

	for (int i = 0; i < 64; i++)
  {
	cache[i].valid = cache[i].visited = cache[i].tag = 0;
  }

	int hit = 0, miss = 0, eviction = 0;
	int count = 1;
	
	int s, E, b, t;
	int printFlag = 0;
	char *filePath = NULL;
	FILE *file;
	
	char opt = getopt(argc, argv, optString);
	while(opt != -1)
	{
		switch(opt)
		{
			case 'h':
				printf("Do not ask me.\n");
				break;
			case 'v':
				printFlag = 1;
				break;
			case 's':
				s = atoi(optarg);
				break;
			case 'E':
				E = atoi(optarg);
				break;
			case 'b':
				b = atoi(optarg);
				break;
			case 't':
				filePath = optarg;
				file = fopen(filePath, "r");
				break;
			default:
				break;
		}
		opt = getopt(argc, argv, optString);
	}
	
	int setNum = 1, lines = E, blockSize;
	for (int i = 1; i <= s; ++i)
		setNum *= 2;
	for (int i = 1; i <= b; ++i)
		blockSize *= 2;
	t = 32 - s - b;
	memset(cache, 0, sizeof(cache));
	
	char trace[30];
	while(fgets(trace, 20, file))
	{
		// if (printFlag)
		// {
		// 	printf("------------\n");
		// 	for (int i = 0; i < setNum; i++)
		// 	{
		// 		printf("index: %d\n", i);
		// 		for (int j = 1; j <= lines; j++)
		// 		{
		// 			printf("    line: %d, v: %d,t: %d,visited: %d \n", j, cache[i * lines + j - 1].valid, cache[i * lines + j - 1].tag, cache[i * lines + j - 1].visited);
		// 		}
		// 	}
		// 	printf("------------\n");
		// }

		int isModify = 0;

		if (trace[0] != ' ')
			continue;
		if (trace[1] == 'M')
			isModify = 1;

		sscanf(trace, "%[^\n]", trace);
		if (printFlag)
			printf("%s", trace);
		
		trace[0] = trace[2] = 'A';
		sscanf(trace, "%*3s%[^,]", trace);
		
		int tag, index;
		unsigned addr = s2bin(trace);
		addr = addr >> b;
		unsigned mask = ((unsigned)0xFFFFFFFF) >> (t + b);
		index = addr & mask;
		tag = addr >> s;
		
//		printf("b=%d, s=%d, mask=%d\n", b, s, mask);
//		printf("addr: %d\n", addr);
		printf("\nindex: %d", index);
		printf(" tag: %d\n", tag);

		
		int find = 0;
		for (int i = index * lines; i < (index + 1) * lines; i++)
		{

			if (cache[i].valid == 1 && cache[i].tag == tag)
			{
				hit++;
				cache[i].visited = count;
				if (printFlag)
					printf(" hit");
				find = 1;
				break;
			}
		}
		if (!find)
		{
			miss++;
			if (printFlag)
				printf(" miss");
			
			int anyEmpty = 0;
			int timeFlag = count;
			int lineFlag;
			for (int i = index * lines; i < (index + 1) * lines; i++)
			{
				if (cache[i].valid == 0)
				{
					anyEmpty = 1;
					cache[i].visited = count++;
					cache[i].valid = 1;
					cache[i].tag = tag;
					break;
				}
				if (cache[i].visited < timeFlag)
				{
					timeFlag = cache[i].visited;
					lineFlag = i;
				}
				
			}
			if (!anyEmpty)
			{
				cache[lineFlag].tag = tag;
				cache[lineFlag].valid = 1;
				
				cache[lineFlag].visited = count++;
				eviction++;
				if (printFlag)
					printf(" eviction");
			}
		}
		if (isModify)
		{
			hit++;
			if (printFlag)
				printf(" hit");
		}
		
		if (printFlag)
			printf("\n");
		
		count++;
	}
	
	// printf("%d %d %d\n", hit, miss, eviction);
	printSummary(hit, miss, eviction);
	return 0;
}
