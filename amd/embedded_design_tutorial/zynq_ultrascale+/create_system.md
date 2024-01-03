
# Zynq UltrScale+ Processing System Configuration with the Vivado Design Suite

This chapter demonstrates how to use the Vivado® Design Suite to develop an embedded system using the Zynq® UltraScale+™ MPSoC Processing System (PS).

The Zynq UltraScale+ device consists of quad-core Arm® Cortex™-A53-based APU, dual-core Arm® Cortex™-R5F RPU, Mali™ 400 MP2 GPU, many hard Intellectual Property (IP) components, and Programmable Logic (PL). This offering can be used in two ways:


- The Zynq UltraScale+ PS can be used in a standalone mode, without attaching any additional fabric IP.</li>
- IP cores can be instantiated in fabric and attached to the Zynq UltraScale+ PS as a PS+PL combination.</li>

## Zynq UltraScale+ System Configuration

Creating a Zynq UltraScale+ system design involves configuring the PS to select the appropriate boot devices and peripherals. To start with, as long as the PS peripherals and available MIO connections meet the design requirements, no bitstream is required. This chapter guides you through creating a simple PS-based design that does not require a bitstream.

## Example: Creating a New Embedded Project with Zynq UltraScale+

For this example, you will launch the Vivado Design Suite and create a project with an embedded processor system as the top level.

### Design Input and Output files

This example design requires no input files. We will create the Vivado design from scratch. The design includes the processing system module of the MPSoC. No PL IPs will be added in this example design, so this design does not need to run through implementation and bitstream generation.

The output of this example design is the hardware configuration XSA. It will be used for further software development.

- Input: N/A</li>
- Output: edt_zcu111_wrapper.xsa</li>


### Starting Your Design

1. Launch the Vivado Design Suite.
2. In the Vivado Quick Start page, click **Create Project** to open the New Project wizard.
3. Use the information in the following table to make selections in each of the wizard screen.

| **Screen**           | **System Property**                | **Setting or Command to Use** |
| -------------------- | ---------------------------------- | ----------------------------- |
| Project Name         | Project Name                       | edt_zcu111                    |
|                      | Project Location                   | Select a folder               |
| Project Type         | Create Project Sub-directory       | Leave checked                 |
|                      | Specify type of project to create  | RTL Project                   |
|                      | Don't specify sources at this time | Leave checked                 |
| Default Part         | Select                             | Select **Boards** tab         |
|                      | Display Name                       | Select ZCU111 Board           |
| New Project Summrary | Project Summary                    | Review project summary        |

4. Click **Finish**. The New Project wizard closes and the project you just created opens in the Vivado design tool.

### Creating a Block Design Project

You will now use the IP integrator to create a block design project.

1. In the Flow Navigator pane, expand IP integrator and click **Create Block Design**.

![](image1.png)

The Create Block Design wizard opens.

2. Use the following information to make selections in the Create Block Design wizard.
   
| **Screen**           | **System Property**                | **Setting or Command to Use** |
| -------------------- | ---------------------------------- | ----------------------------- |
| Create Block Design  | Design Name                        | edt_zcu111                    |
|                      | Directory                          | <Local to Project             |
|                      | Specify Source                     | Set Design Sources            |

3. Click **OK.**

The Diagram view opens with a message stating that this design is empty. The next step is to add some IP from the catalog.

4. Click **Add IP** ![](add.png).
5. In the search box, type <zynq> to find the Zynq device IP.
6. Double-click the **Zynq UltraScale+ MPSoC IP** to add it to the block design.

The Zynq UltraScale+ MPSoC processing system IP block appears in the Diagram view, as shown in the following figure.
![](image2.png)

### Managing the Zynq UltraScale+ Processing System in Vivado

Now that you have added the processing system for the Zynq MPSoC to the design, you can begin managing the available options.

1. Double-click the **Zynq UltraScale+ Processing System** block in the Block Diagram window.

The Re-customize IP view opens, as shown in the following figure. Notice that by default, the processor system does not have any peripherals connected.

![](images/image3.jpg)




