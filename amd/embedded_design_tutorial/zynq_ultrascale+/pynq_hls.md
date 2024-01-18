
# Tutorial_1

Simple tutorial showing the Vivado PYNQ Design Flow using a simple Adder Example running on a ZCU111 board. 

Designs a custom IP in Vivado HLS to perform the following function using the AXI-Lite interface:

``` **def** tutorial_1(A, B, C, Y):
def add(A, B, C, Y):
	Y = A + 2*B - C;
```



## Preliminary
- Vitis HLS 2021.1
- Vivado 2021.1
- Xilinx ZCU111 FPGA Evaluation Board
- PYNQ Image fpr the ZCU111 board (tested using v2.7)

Note: Xilinx has a Y2K bug starting 2022 so please apply fixes first. Details can be found at [this Piazza post](https://piazza.com/class/kyaogfd8r1s2xl?cid=14)

## Environment Setup

Assuming you have Vitis HLS and Vivado installed. Please execute the following commands, or add them to your bash file.
```sh
source /tools/Xilinx/Vitis_HLS/2021.1/settings64.sh
alias vitis_hls="/tools/software/xilinx/Vitis_HLS/2021.1/bin/vitis_hls"
alias vivado="/tools/software/xilinx/Vivado/2021.1/bin/vivado"
```

## Design a simple adder using Vitis HLS

We first build a vector addition function using C++ in Vitis HLS. Later, we export the RTL (Verilog) design in Vivado to implement it on the board.

### Steps

1. Change to the tutorial_1 directory and run vitis_hls software.
2. Select the "Create Project". In the "New Vitis HLS Project" set the **Project Name** to *add* and set the **Location** to tutorial_1/hls path. Click on Next>.
3. In the Add/Remove Design Files click on AddFiles... and select both the lab_1.cpp and lab_1.h files and then click Open. Select Browse next to the Top Function and select add(lab_1.cpp). Click on Next>.
4. On the Add/Remove Testbench Files screen select AddFiles... and add the lab_1_test.cpp file. Click to go to next screen.
5. On the Solution Configuration screen under the Part Selection click on the ... button to the right. This will open up a Device Selection Dialog. For this tutorial we are developing for the Xilinx ZCU111 Ultra Scale board so select the Boards button and search and select the 'Zynq Ultrascale+ZCU111 Evaluation Platform' board. Keep the Solution Name, Clock Period and Uncertainty set to their default values. The Flow Target should be set to Vivado IP Flow Target. Click the Finish button to complete the configuration.
6. Once the project is set up click on the lab_1.cpp file. On the right hand side of the UI their should be a Directive Tab. Click on this tab. Right click on the *add* function and select "Insert Directive..."
7. On the Vitis HLS Directive Editor Screen select "INTERFACE" for the Directive. On the mode option select ap_ctrl_none. Select OK. You should see this directive under the add function on the Directive tab.
8. For the A, B, C, and Y inputs right click on each of these and select the "Insert Directive...". For each select the INTERFACE Directive and s_axilite mode. Again you can check each input on the Directive tab for verification. 
9. Run the test simulation code by selecting Project->Run C Simulation. The output should contain no errors. Correct any errors before preceding to the next steps.
10. Run the synthesis process. Select Solution->Run C Synthesis->Active Solution or select the green arrow in toolbars to run the synthesis. When completed a Synthesis Summary report should be displayed. This report will display performance and resource estimates for the design.
11. Note: In the Explorer tab navigate to solution1->impl->misc->drivers->add_v1_0->src->xadd_hw.h. If you open this file it will show the hardware addresses where you can write/read from for setting and accessing the data.
12. Run the Export RTL as IP/XO from Solution->Export RTL. This will open up a Export RTL window. In this window select Vivado IP(.zip) as the Export Format. Insert a Vendor for the IP Configuration (e.g src.com). Insert a Version number (eg. 1.0) A Library (e.g. 1)



## Implement the add function on FPGA using Vivado

1. After HLS is completed and the hardware is exported you can now open the vivado software.

2. On vivado select the Create Project. This will open up a "New Project" window. Click Next. Set the Project Location to tutorial_1/vivado. Set the Project Name to tutorial_1. Select Next. On the Project Type window select RTL Project and select the "Do not specify sources at this time". Then click Next. On the Default Part window select the Boards tab and search and select the 'Zynq Ultrascale+ ZCU111 Evaluation Platform'. Select Next and finally select Finish. 

3. Now we need to import our new IP that we generated. Click on Tools->Settings... This will open up the Settings window. Now select Project Settings->IP->Repository. Click on the + icon at upper left and add the folder where the IP is located. This should be in hls/src/add/solution1. Should see the Add IP included. Click OK and exit out of the Settings window.

4. In the Flow Navigator click on IP Integrator->Create Block Design. Use the default and click OK. This should open up a new Diagram Panel. In the Diagram Panel press the + button to add the processor board. Search and select the Zynq UltraScale+ MPSoC board IP. When finished run the "Run Block Automation" and click OK.

5. Now add the **Add** IP that we created to the design. Click on the + button to add IP. After added run the "Run Connection Automation". This sets up the AXI Lite interface. In the diagram you will see the AXI Interconnect IP. This IP manages the communication between multiple masters and slaves.

6. Note: Under the Address Editor you can find the Offset Address and Range of memory that the PYNQ MMIO library can use to address the data.

7. In the Diagram window validate the design to be sure there are no errors. 

8. Create an HDL wrapper. In the Source Window select and right click the design_1 (design_1.bd) and select "Create HDL Wrapper...". Using the default "Let Vivado manager wrapper and auto-update" select OK.

9. Generate BitStream. After the HDL wrapper has been created. Go to the Flow Navigator window and select Program and Debug->Generate Bitstream. Use the defaults and click OK. This will take a while. You can monitor the progress of the synthesis looking at the top right section of the Vivado UI.

10.  Collect and copy the generated files over into a separate folder:

    ```
    cd tutorial_1
    mkdir pynq
    cp vivado/tutorial_1/tutorial_1.runs/impl_1/design_1_wrapper.bit pynq/tutorial_1.bit
    cp vivado/tutorial_1/tutorial_1.gen/sources_1/bd/design_1/hw_handoff/design_1.hwh pynq/tutorial_1.hwh
    cp vivado/tutorial_1/tutorial_1.srcs/sources_1/bd/design_1/design_1.bd pynq/tutorial_1.bd
    ```

    

## Deploy the add function to FPGA and control it using Python



1. Start up the ZCU111 Development board running the ZYNQ environment.

2. Connect the ethernet cable to a standalone computer. 

3. Open up a browser and test that you have a connection to the Jupyter server running on the ZCU111. Navigate the browser to 192.168.2.99:9090. This should up a Jupyter tree display of the folders on the PYNQ device.

4. On the jupyter page in the top right corner select New->Folder. This will create a new folder on the PYNQ device. Select this folder and then select "Rename" and rename to tutorial_1. Next change into the "tutorial_1" directory and select the Upload button which will bring up an Open Files window. Select the files (tutorial_1.bd, tutorial_1.bit and tutorial_1.hwh) that you ported over to the tutorial_1/pynq directory earlier and upload these to the device.

5. Below is the example Python host code to control the FPGA kernel. You can add these command to the jupyter notebook and run.

   ```python
   from pynq import Overlay
   overlay = Overlay("./tutorial.bit")
   
   overlay?
   
   def uint_to_int(num, bits):
       """ Compute the 2's complement of int value val"""
       if (num & (1 << (bits - 1))) != 0:
           num = num - (1 << bits)
       return num
       
   top_func = overlay.add_0
   
   a = 1979 
   b = 9023
   c = 112
   
   #top_func.write(0x10,1123) Alternate way to write to register
   top_func.register_map.A = a
   top_func.register_map.B = b
   top_func.register_map.C = c
   
   # Shows the values of the register map, the output should equal to a+2*b-c
   top_func.register_map
   
   print(a+2*b-c)
   
   top_func.register_map.Y
   val = top_func.read(0x28)
   val
   
   # Testing IP
   import random
   for i in range(10):
       val_A = random.randint(1,999)
       val_B = random.randint(1,999)
       val_C = random.randint(1,999999)
       top_func.register_map.A = val_A
       top_func.register_map.B = val_B
       top_func.register_map.C = val_C
       
       ground_truth = val_A + 2*val_B - val_C
       val = top_func.read(0x28)
       
       ival = uint_to_int(val,32)
       
       if (ival != ground_truth):
           print(f"Error!")
           print(f"{val_A} + 2*{val_B} - {val_C}")
           print(f"val: {ival} != gnd_truth: {ground_truth}")
       else:
           print(f"val: {ival} equals to ground_truth: {ground_truth}")
   ```
