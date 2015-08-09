#include <inttypes.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <time.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
	int number = 0;
	int result[25] = {0};
	double elapsed_avg_nsec[400] = {0};
	uint64_t nsec1 = 0;
	uint64_t nsec2 = 0;
	uint64_t elapsed_nsec = 0;
	double final_time_sum = 0;
	struct timespec t_start, t_end;
	FILE *file = fopen("./result.txt", "a");

	if(scanf("%d", &number)==EOF)
	{
		printf("scanf error\n");
	}

	if (file) {
		clock_gettime(CLOCK_MONOTONIC, &t_start);
		int i=0;
		for (i = 0;i < 400; i++) {
			nsec1 = 0;
			nsec2 = 0;
			elapsed_nsec = 0;
			nsec1 = ((uint64_t)(t_start.tv_sec) * 1000000000LL + t_start.tv_nsec);
			//Avoid branch(without for loop)
			result[0] = fibonacci(number);
			result[1] = fibonacci(number);
			result[2] = fibonacci(number);
			result[3] = fibonacci(number);
			result[4] = fibonacci(number);
			result[5] = fibonacci(number);
			result[6] = fibonacci(number);
			result[7] = fibonacci(number);
			result[8] = fibonacci(number);
			result[9] = fibonacci(number);
			result[10] = fibonacci(number);
			result[11] = fibonacci(number);
			result[12] = fibonacci(number);
			result[13] = fibonacci(number);
			result[14] = fibonacci(number);
			result[15] = fibonacci(number);
			result[16] = fibonacci(number);
			result[17] = fibonacci(number);
			result[18] = fibonacci(number);
			result[19] = fibonacci(number);
			result[20] = fibonacci(number);
			result[21] = fibonacci(number);
			result[22] = fibonacci(number);
			result[23] = fibonacci(number);
			result[24] = fibonacci(number);
			clock_gettime(CLOCK_MONOTONIC, &t_end);

			nsec2 = (uint64_t)(t_end.tv_sec) * 1000000000LL + t_end.tv_nsec;
			//printf("%" PRIu64 "\n", nsec1);
			//printf("%" PRIu64 "\n", nsec2);
			elapsed_nsec = nsec2 - nsec1;
			elapsed_avg_nsec[i] = (((double)elapsed_nsec) / 25.0);
		}
		int j = 0;
		for (j = 0; j < 400; j++) {
			final_time_sum += elapsed_avg_nsec[j];
		}
		double final_avg_time = final_time_sum / 400.0;
		fprintf(file, "%d %d %lf\n", number, result[0], final_avg_time);

		printf("The fibonacci sequence at %d is: %d , avg_time: %lf\n", number,
		       result[0], final_avg_time);
		fclose(file);

	} else {
		printf("Open file error!\n");
	}
	return 0;

}

