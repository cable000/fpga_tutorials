# Verilog simulation Tutorial

Requirements
Vivado Installation (Currently using Vivado 2021.2)

Hardware:
ZCU111

### Creating from scratch

Start up a Vivado session. Choose create project and add ZCU111 as FPGA board.

To add a verilog file select AddSources->Add or Create design sources. On the next page select 'Create File'. Use Verilog File type and select a file name. On the Define Module window you can add the ports here or in the text editor. Click Ok to complete the creation of the verilog. In the sources panel you should see the verilog file you created. You can double click on this to pull it up in an editor. To add a Test Bench file to test the verilog code you add select AddSources->Add or create simulation sources.

After editing the files you can run SIMULATION->Run Simulation and a waveform window will open. To see the waveform you may have to zoom in. Every 10 ns of the waveform the inputs and outputs will change.

To view the RTL schematic of the diagram you can click on RTLAnalysis->Open Elaborated Design->Schematic
