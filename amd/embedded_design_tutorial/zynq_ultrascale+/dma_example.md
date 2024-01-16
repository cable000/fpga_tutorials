
# DMA Project

### Hardware components
AMD ZCU111 board

### Software apps
AMD Xilinx Vivado 2021.2

# Create New Vivado Project

Launch Vivado and select the option to create a new project. Give it the desired name and specify the desired file path in the first few windows that pop up. One of the windows will ask what project type is being created. This is a basic RTL Project being created that is not an extensible Vitis platform, meaning that it is not a project targeting accelerated applications and the specialized components such as the specific kernel they require. Therefore leave the **Project is an extensible Vitis platform** box unchecked. Unless you have RTL files (Verilog or VHDL files) ready to import into the project already, check the box Do not specify sources at the time.

![](dma_example/image1.png)

1. Start up a new Vivado project for the ZCU111 board.
2. Select the **Create Block Design** and add the Zynq UltraScale+ MPSoC processor.
3. Select **Run Block Automation**.
4. Add an instance of the AXI Direct Memory Access IP block to the Vivado block design. Double-click on it to open the configuration window and uncheck the box next to Enable Scatter Gather Engine. This will automatically uncheck the box next to Enable Control / Status Stream as well.

  The rest of the default options can be left for the AXI DMA IP. Click OK to close the configuration window.

  Click the option to Run Connection Automation that appears in the green banner across the top of the block design window. Check the box for All Automation and click OK.
