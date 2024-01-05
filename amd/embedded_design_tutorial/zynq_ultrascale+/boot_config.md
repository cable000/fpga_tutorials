
## Boot and Configuration

This chapter shows how to integrate the software and hardware components generated in the previous steps to create a Zynq® UltraScale+™ boot image. After reading this chapter, you will understand how to integrate and load boot loaders, bare-metal applications (for APU/RPU), and the Linux OS for a Zynq UltraScale+ system in different boot requirements: QSPI, SD card, JTAG, and so on.

The following key points are covered in this chapter:
- System software: FSBL, PMU firmware, U-Boot, Trusted Firmware-A (TF-A)
- Application processing unit (APU): configuring SMP Linux for APU
- Real-time processing unit (RPU): configuring bare-metal for RPU in lockstep
- Creating a boot image for the following boot sequence:
  1. APU
  2. RPU lockstep
- Creating and loading a secure boot image
