# Basic HLS Example Tutorial

Download the hls_example folder onto your development machine.

Run the following command:

`vitis_hls -f run_hls.tcl`

This command will run RTL synthesis, simulation, implementation and package the design into an IP format.

# Validate IP package in Vivado

In the same directory execute the following command to open up Vivado:

`vivado`

1. Select **Create Project** and keep selecting **Next** until you get to the **Default Part** window. On this window select **Boards** and search for **zcu111** and select this board. Select **Next** and then **Finish** to exit.

Under **Project Manager** select **Settings** and the following window should be displayed.

![](images/hls_example/image1.png)

Select **IP->Repository** and then click the **+"" to add the hls_example folder that contains the example IP package.

![](images/hls_example/image2.png)


Select the **Example Design** repository and click **OK** in this window. 

![](images/hls_example/image3.png)








