
This simulation creates and tests the functional simulation of a 4x4 multiplixer using VHDL. Shows the basics of creating a testbench to test the code.

- Open the Vivado tool
- Under source either create (copy and paste) or add the mux_4x4.vhd and mux_4x4_tb.vhd code. Make sure that these files are selected as the 'top'.

After creating or adding these files to Vivado you can view the RTL schematic of the design by selecting the following:
  FlowNavigator->RTL Analysis->Open Elaborated Design->Schematic.

Run the functional simulation of the circuit by selecting the following:
  FlowNavigator->Simulation and then select 'Run Behavioral Simulation'. Then should open a waveform where you can check the expected results from the testbench.
