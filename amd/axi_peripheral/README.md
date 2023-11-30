

# AXI4-Lite Interface Wrapper for custom RTL

## Hardware

## Software
AMD Vivado Design Suite

Steps:
Create a new no-sources Vivado project using the ZCU111 development board

To create a new AXI4 peripheral IP in Vivado, select <b>Tools > Create and Package New IP...</b>

A window will pop up in the current Vivado Project that is open with a brief summary of options available, including the option to create a new AXI4 peripheral. Click Next to continue on.

On the second page, select the option Create a new AXI4 peripheral. Set the name to SimpleLogicModule

Note: don't use dashes or other illegal characters in the name field.As whatever is passed in the Name field is used as the Verilog module name for the IP.

The next page allows for you to set the number of master and slave AXI interfaces the custom peripheral needs. This includes the type of AXI each interface is. In this case, only one slave AXI4-Lite interface is needed since we're just needing the C application to be able to write to a register in the RTL. Use only the Lite interface type.

Furthermore on this page, there are settings to configure such as the width of the data bus of the AXI interface and the number of registers available to write to/read from. The default data width is 32 bits which is what I stuck with. Select the number of registers to 8.

On the next page select the Edit IP option and click Finish. This will bring up a second Vivado window.

In the new window expand on the SimpleLogicModule created in the sources. Open up the S00 version of the SimpleLogicModule verilog file. Scrolling down to the bottom of this file we will add our code to the section under // Add user logic here.

`verilog`

```
wire [31:0] sum;
wire [31:0] difference;
wire [31:0] bitwiseAnd;
wire [31:0] bitwiseOr;
wire [31:0] bitwiseXor;
wire [31:0] bitwiseXNor;

SimpleLogicModule SimpleLogicModule_inst(
  .a(slv_reg0),
  .b(slv_reg1),
  .sum(sum),
  .difference(difference),
  .bitwiseAnd(bitwiseAnd),
  .bitwiseXor(bitwiseXor),
  .bitwiseXNor(bitwiseXNor)
);
```
Add the following lines in the `always` block between `else begin` and `if (slv_reg_wren)`. This makes sure these registers are updated on every clock cycle.

```
  slv_reg2 <= sum;
  slv_reg3 <= difference;
  slv_reg4 <= bitwiseAnd;
  slv_reg5 <= bitwiseOr;
  slv_reg6 <= bitwiseXor;
  slv_reg7 <= bitwiseXNor;
```

Under sources select the SimpleLogicModule_inst file and right-click and select +AddSources. Select the Add or Create design sources and select next. Select the Create File button. On the window select Verilog File type. Set file name to SimpleLogicModule. Under the file location select the ip_repo/SimpleLogicModule_1.0/hdl folder and select the ok button. Select the Finish button. On the Define Module window don't add any ports here and just select ok and yes.

Open up the editor for the SimpleLogicModule file just created. Replace the SimpleLogicModule code with the following and save the file.

```
module SimpleLogicModule(
  input [31:0] a,
  input [31:0] b,
  input [31:0] sum,
  input [31:0] difference,
  input [31:0] bitwiseAnd,
  input [31:0] bitwiseOr,
  input [31:0] bitwiseXor,
  input [31:0] bitwiseXNor
);
assign sum = a+b;
assign difference = a-b;
assign bitwiseAnd = a&b;
assign bitwiseOr = a|b;
assign bitwiseXor = a^b;
assign bitwiseXNor = a~^b;
endmodule
```




Move to the Package IP - SimpleLogicModule and select the File Groups. Click on the Merge changes from File Groups Wizard. There now should be a green check next to the File Groups. Finally on the Review and Package tab select Re-Package IP and close out this window by selecting ok.

Going back to the initial Vivado window lets now create a simple design using this new AXI IP peripheral. To create a new design select IP Integrator->Create Block Design. Add the Zynq UltraScale+ MPSoC and the SimpleLogicModule we just created. Select all the Designer Assistance suggestions to make the necessary connections. When this is finished create a HDL wrapper around the design by right clicking the project design under the Sources tab and select 'Create HDL wrapper' . At this point you should be complete and now we can synthesize the design to test on the hardware. In the Flow Navigator under Program and Debug select Generate Bistream to build the bitstream.




Other resources that may be helpful:

Vivado Tutorial: Turn Verilog IP into AXI Module \
https://www.youtube.com/watch?v=mBRUK196qIA
