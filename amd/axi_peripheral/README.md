

# AXI4-Lite Interface Wrapper for custom RTL

## Hardware

## Software
AMD Vivado Design Suite

Steps:
Create a new no-sources Vivado project using the ZCU111 development board


To create a new AXI4 peripheral IP in Vivado, select <b>Tools > Create and Package New IP...</b>

A window will pop up in the current Vivado Project that is open with a brief summary of options available, including the option to create a new AXI4 peripheral. Click Next to continue on.

On the second page, select the option Create a new AXI4 peripheral then give the peripheral the desired name, version, and description info on the following page.

Note: don't use dashes or other illegal characters in the name field.As whatever is passed in the Name field is used as the Verilog module name for the IP.

The next page allows for you to set the number of master and slave AXI interfaces the custom peripheral needs. This includes the type of AXI each interface is. In this case, only one slave AXI4-Lite interface is needed since we're just needing the C application to be able to write to a register in the RTL.

Furthermore on this page, there are settings to configure such as the width of the data bus of the AXI interface and the number of registers available to write to/read from. The default data width is 32 bits which is what I stuck with. And the minimum number of registers is 4, which is plenty for the C application to pass data to the QDSP-6061 driver.


Citations: \

Vivado Tutorial: Turn Verilog IP into AXI Module \
https://www.youtube.com/watch?v=mBRUK196qIA
