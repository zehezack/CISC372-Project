#include <math.h>
#include <stdio.h>
#include <float.h>
#include <sys/time.h>
#include <openacc.h>

int main() {
    struct timeval start, end;
    int digs = DECIMAL_DIG;
    long long precision = powl(2,31) - 1;
    double result = 0;
    gettimeofday(&start, NULL);

    #pragma acc parallel 
    {
    #pragma acc loop reduction(+:result)
    for (long long i=1; i<precision;i+=4) {
            result += (double)1/i;
    }

    #pragma acc loop reduction(+:result)
    for (long long i=3; i<precision;i+=4) {
            result += -((double)1/i);
    }
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
}

