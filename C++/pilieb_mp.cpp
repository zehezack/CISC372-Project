#include <omp.h>
#include <stdio.h>
#include <float.h>
#include <sys/time.h>
#include <limits.h>

int main() {
        double start_time, total_time;
	int digs = DECIMAL_DIG;
        long long precision = (long) INT_MAX; 
        double result_add, result_minus;
	start_time = omp_get_wtime();
	#pragma omp parallel for reduction(+:result_add)
	for (long long i = 1; i < precision; i += 4) {
                result_add += (double) 1/i;
        }
	#pragma omp parallel for reduction(+:result_minus)
	for (long long i = 3; i < precision; i += 4) {
		result_minus += (double) 1/i;
	}
       	total_time = omp_get_wtime() - start_time;
	printf("Pi is approximately %.*e\n", digs, (result_add - result_minus)*4);
        printf("Time taken: %lf\n seconds", total_time);
        return 0;
}

