#include <openacc.h>
#include <stdio.h>
#include <float.h>
#include <time.h>
#include <limits.h>

#define getClock() ((double)clock() / CLOCKS_PER_SEC)

int main() {
	int digs = DECIMAL_DIG;
        long long precision = (long) INT_MAX; 
        double result_add, result_minus;
	double time_start = getClock();
	#pragma acc parallel loop reduction(+:result_add)	
	for (long long i = 1; i < precision; i += 4) {
                result_add += (double) 1/i;
        }
	#pragma acc parallel loop reduction(+:result_minus)
	for (long long i = 3; i < precision; i += 4) {
		result_minus += (double) 1/i;
	}
	double time_end = getClock();
	printf("time (s)= %.6f\n", time_end - time_start);
	printf("Pi is approximately %.*e\n", digs, (result_add - result_minus)*4);
        return 0;
}

