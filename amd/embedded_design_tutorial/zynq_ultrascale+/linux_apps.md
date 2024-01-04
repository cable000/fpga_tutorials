
## Building and Debugging Linux Applications

The earlier examples highlighted the creation of bootloader images and bare-metal applications for APU, RPU, and PMU using the Vitis™ IDE. This chapter demonstrates how to develop Linux applications.

## Example 8: Creating Linux Images and Applications using PetaLinux

In this example, you will configure and build a Linux operating system platform for an Arm™ Cortex-A53 core based APU on a Zynq® UltraScale+™ MPSoC. You can configure and build Linux images using the PetaLinux tool flow, along with the board-specific BSP. The Linux application is developed in the Vitis IDE.

## Input and Output Files

- Input:
  - Hardware XSA (edt_zcu102_wrapper.xsa generated in Example 1)
  - [ZCU102 PetaLinux BSP](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html)
- Output:
  - PetaLinux boot images (BOOT.BIN, image.ub)
  - PetaLinux application (hello_linux)

