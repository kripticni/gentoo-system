# NVIDIA GPU Support Patch

## Purpose

This patch enables direct integration with NVIDIA GPU stats by linking against the  
`libnvidia-ml` library (NVML), avoiding the need to repeatedly fork and exec the `nvidia-smi` binary  
(which is over 1.1 MB in size) from a running shell to obtain some performance information.  
It’s also designed with reusability in mind for performance-sensitive environments,  
considering that the `nvidia-smi` approach is not very suckless this patch was  
very much needed for a project like this.

## What It Does

- Adds `-lnvidia-ml` linking in `config.mk`
- Adds `nvml.h` to components for inclusion
- Introduces `gpu.c` which provides two functions:
  - `gpu_perc` – returns GPU utilization
  - `gpu_temp` – returns GPU temperature

(You can extend it to expose more NVML metrics if wanted.)

## Warning

This has **only been tested on my system**:
- Custom kernel Gentoo Linux
- NVIDIA RTX 4060 Mobile

I am unsure if it would work on other kernel version, or even driver versions.  
