
1. Start up a new Vivado project for the ZCU111 board.
2. Select the **Create Block Design** and add the Zynq UltraScale+ MPSoC processor.
3. Select **Run Block Automation**.
4. Add an instance of the AXI Direct Memory Access IP block to the Vivado block design. Double-click on it to open the configuration window and uncheck the box next to Enable Scatter Gather Engine. This will automatically uncheck the box next to Enable Control / Status Stream as well. 
