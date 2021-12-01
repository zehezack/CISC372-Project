#include <stdio.h>
#include <float.h>
#include <sys/time.h>
#include <limits.h>

int main() {
       	struct timeval start, end;
	int digs = DECIMAL_DIG;
        long long precision = (long) INT_MAX; 
        double result = 0;
	gettimeofday(&start, NULL);
	for (long long i = 1; i < precision; i += 2) {
                if ((i+1)%4) result += (double) 1/i;
		else result -= (double) 1/i;
        }
       	gettimeofday(&end, NULL);
	long sec_take = (end.tv_sec-start.tv_sec);
    	long usec_take = (end.tv_usec-start.tv_usec);
    	if (usec_take < 0) {
            	sec_take -= 1;
            	usec_take += 1000000;
    	}
	printf("Pi is approximately %.*e\n", digs, result*4);
    	printf("Time taken: %ld seconds, %ld microseconds\n", sec_take, usec_take);
        return 0;
}

