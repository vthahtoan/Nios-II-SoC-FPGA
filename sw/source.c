#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include "system.h"
#include "io.h"

#define WAVE_SQUARE   0
#define WAVE_TRIANGLE 1
#define WAVE_SINE     2
#define WAVE_COSINE   3

#define REG_FREQ_OFFSET 0
#define REG_TYPE_OFFSET 1

#define SYSTEM_CLOCK_MHZ 50.0
#define PHASE_ACC_MAX 4294967296.0

void wave_set_frequency(float freq_MHz) {
    double step_calc = (freq_MHz * PHASE_ACC_MAX) / SYSTEM_CLOCK_MHZ;
    uint32_t step = (uint32_t)step_calc;
    IOWR(WAVE_GEN_AVALON_0_BASE, REG_FREQ_OFFSET, step);
}

void wave_set_type(uint8_t type) {
    IOWR(WAVE_GEN_AVALON_0_BASE, REG_TYPE_OFFSET, (type & 0x03));
}

int main() {
    printf("Bat dau chay SignalTap Test...\n");

    wave_set_frequency(0.5);

    while (1) {
        printf("Dang phat: Song Vuong (500 KHz)\n");
        wave_set_type(WAVE_SQUARE);
        usleep(2000000);

        printf("Dang phat: Song Tam Giac (500 KHz)\n");
        wave_set_type(WAVE_TRIANGLE);
        usleep(2000000);

        printf("Dang phat: Song Sin (500 KHz)\n");
        wave_set_type(WAVE_SINE);
        usleep(2000000);

        printf("Dang phat: Song Cosine (500 KHz)\n");
        wave_set_type(WAVE_COSINE);
        usleep(2000000);
    }

    return 0;
}
