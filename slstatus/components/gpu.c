#include <stddef.h>
#include <stdio.h>
#include "nvml.h"
#include "../util.h"
#include <stdbool.h>

static nvmlDevice_t device = NULL;
static bool nvml_initialized = 0;

static int
nvml_init_once(void)
{
    if (nvml_initialized)
        return 1;

    if (nvmlInit() != NVML_SUCCESS)
        return 0;

    if (nvmlDeviceGetHandleByIndex(0, &device) != NVML_SUCCESS) {
        nvmlShutdown();
        return 0;
    }

    nvml_initialized = 1;
    return 1;
}

const char *
gpu_perc(const char* unused)
{
    nvmlUtilization_t utilization;

    if (!nvml_init_once())
        return NULL;

    if (nvmlDeviceGetUtilizationRates(device, &utilization) != NVML_SUCCESS)
        return NULL;

    return bprintf("%d", utilization.gpu);
}

const char *
gpu_temp(const char* unused)
{
    unsigned int temp;

    if (!nvml_init_once())
        return NULL;

    if (nvmlDeviceGetTemperature(device, NVML_TEMPERATURE_GPU, &temp) != NVML_SUCCESS)
        return NULL;

    return bprintf("%d", temp);
}
