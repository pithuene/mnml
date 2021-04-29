#include <sys/time.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

static char base36_digits[36] = {
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
    'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
    'u', 'v', 'w', 'x', 'y', 'z'
};

static long pow36_index[13] = {
    1, 36, 1296, 46656, 1679616, 60466176,
    2176782336, 78364164096, 2821109907456,
    101559956668416, 3656158440062976,
    131621703842267136, 4738381338321616896
};

char * to_b36(long v) {
    /* Determine how many digits the b36 representation has */
    int num_digits = 0;
    while (v > pow36_index[num_digits]) {
        num_digits++;
    }

    /* Construct the b36 string */
    char * b36 = (char *) malloc(num_digits + 1);
    int idx;
    b36[num_digits] = '\0';
    for (idx = 1; idx < num_digits + 1; idx++) {
        char c = base36_digits[v%36];
        v /= 36;
        b36[num_digits - idx] = c;
    }
    return b36;
}


/* Get current UNIX time in milliseconds */
long current_millis(void) {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    long int ms = tv.tv_sec * 1000 + tv.tv_usec / 1000;
    return ms;
}

/* Generates a unique time based id string */
int main(void) {
    long time = current_millis();
    /* Sleep for 1 millisecond to ensure uniqueness */
    struct timespec ts;
    ts.tv_sec = 0;
    ts.tv_nsec = 1000000;
    nanosleep(&ts, NULL);
    printf("%s\n", to_b36(time));
    return 0;
}
