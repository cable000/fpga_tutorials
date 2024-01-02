
# Zynq UltrScale+ Processing System Configuration with the Vivado Design Suite

This chapter demonstrates how to use the Vivado® Design Suite to develop an embedded system using the Zynq® UltraScale+™ MPSoC Processing System (PS).

The Zynq UltraScale+ device consists of quad-core Arm® Cortex™-A53-based APU, dual-core Arm® Cortex™-R5F RPU, Mali™ 400 MP2 GPU, many hard Intellectual Property (IP) components, and Programmable Logic (PL). This offering can be used in two ways:

<ul>
  <li>The Zynq UltraScale+ PS can be used in a standalone mode, without attaching any additional fabric IP.</li>

  <li>IP cores can be instantiated in fabric and attached to the Zynq UltraScale+ PS as a PS+PL combination.</li>
</ul>

## Zynq UltraScale+ System Configuration

Creating a Zynq UltraScale+ system design involves configuring the PS to select the appropriate boot devices and peripherals. To start with, as long as the PS peripherals and available MIO connections meet the design requirements, no bitstream is required. This chapter guides you through creating a simple PS-based design that does not require a bitstream.

## Example: Creating a New Embedded Project with Zynq UltraScale+

For this example, you will launch the Vivado Design Suite and create a project with an embedded processor system as the top level.

### Design Input and Output files

This example design requires no input files. We will create the Vivado design from scratch. The design includes the processing system module of the MPSoC. No PL IPs will be added in this example design, so this design does not need to run through implementation and bitstream generation.

The output of this example design is the hardware configuration XSA. It will be used for further software development.

<ul>
<li>Input: N/A</li>
<li>Output: edt_zcu111_wrapper.xsa</li>
</ul>





