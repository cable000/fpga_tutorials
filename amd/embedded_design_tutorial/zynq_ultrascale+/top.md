# Zynq Ultrascale+ MPSoC Embedded Design Tutorial

This document provides an introduction to using the Vivado® Design Suite flow for the Xilinx® Zynq|reg| UltraScale+™ MPSoC ZCU104 and RFSoC ZCU111 evaluation boards. The tool used is the Vitis™ unified software platform version 2021.2.

The best way to learn a tool is to use it. This guide provides opportunities for you to work with the tools under discussion. Specifications for sample projects are given in the example sections, along with an explanation of what is happening behind the scenes. Each chapter and examples are meant to showcase different aspects of embedded design. The example takes you through the entire flow to complete the learning and then moves on to another topic.

The examples in this document were created using Xilinx tools running on Ubuntu, 64-bit operating system, and PetaLinux on Linux 64-bit operating system. Other versions of the tools running on other Windows/Linux installations might provide varied results. These examples focus on introducing you to the following aspects of embedded design.


[Zynq Ultrascale+ MPSoc System Configuration with Vivado](create_system.md) describes the creation of a system with the Zynq UltraScale+ MPSoC Processing System (PS) and the creation of a hardware platform for Zynq UltraScale+ MPSoC. This chapter is an introduction to the hardware and software tools using a simple design as the example.

[Building Software for PS Subsystems](build_software.md) describes the steps to configure and build software for processing blocks in the processing system, including the application processing unit (APU) and real-time processing unit (RPU). It also covers the creation of bare-metal applications targeting the APU and RPU and how to conduct a review of the boot components in a hardware platform.

[Debugging Standalone Applications](debugging_apps.md) with the Vitis Debugger provides an introduction to debugging software using the debug features of the Vitis IDE. This chapter uses the previous design and runs the software bare metal (without an OS) to demonstrate the debugging process. This chapter also lists the debug configurations for Zynq UltraScale+ MPSoC.

[Building and Debugging Linux Applications](linux_apps.md) creates a Linux image with PetaLinux and creates a “Hello World” Linux application with the Vitis IDE. It also shows how to debug Linux applications with the Vitis IDE.

[System Design Example: Using GPIO, Timer and Interrupts](system_design.md) adds some IPs in the PL. It demonstrates how you can use the software blocks you configured in previous chapters to create a complex Zynq UltraScale+ system.

[System Design Example: Using DMA in Embedded Linux](dma_example.md). This tutorial will demonstrate an application that reads/writes data to DDR memory from the Linux userspace.


[Boot and Configuration](boot_config.md) shows the integration of components to configure and create boot images for a Zynq UltraScale+ system. The purpose of this chapter is to understand how to integrate and load boot loaders.

Secure Boot is an optional chapter that introduces the steps to build the Hardware Root of Trust and encryption for your design.

# Application Acceleration Development Flow tutorials

[Xilinx Vitis Custom Embedded Platform Creation Example on ZCU104](https://github.com/Xilinx/Vitis-Tutorials/blob/2021.2/Vitis_Platform_Creation/Introduction/02-Edge-AI-ZCU104/README.md) AMD tutorial on creating a custom Vitis embedded platform for ZCU104. It will be capable to run Vitis acceleration applications including Vitis-AI applications. Of course, general embedded software application can also run on this platform. This tutorial uses Application Acceleration Development Flow. 


## Support Files

[The installation process](install_process.md) shows the steps for setting up the SD Card, installing the PetaLinux OS and verifying the installation through a USB serial connection to the device.
