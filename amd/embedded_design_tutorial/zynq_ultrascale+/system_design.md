
## Design Example 1: Using GPIOs, Timers, and Interrupts

The Zynq® UltraScale+™ MPSoC ZCU102 evaluation board comes with a few configurable switches and LEDs. This design example makes use of bare-metal and Linux applications to toggle these LEDs, with the following details:

  - The Linux APU runs Linux, while the RPU R5-0 hosts another bare-metal application.
  - The Linux applications configure a set of PL LEDs to toggle using a PS dip switch, and another set of PL LEDs to toggle using a PL Dip Switch (SW17).
  - The R5-Core 0 application uses an AXI Timer IP in the programmable logic to toggle PS LED (DS50). The application is configured to toggle the LED state every time the timer counter expires, and the timer in the PL is set to reset periodically after a configurable time interval.
  - The system is configured so that the APU Linux application and RPU bare-metal application run simultaneously.

### Configuring Hardware 

The first step in this design is to configure the PS and PL sections. This can be done in Vivado® IP integrator. Start with adding the required IPs from the Vivado IP catalog, and then connect the components to blocks in the PS subsystem.

1. If the Vivado Design Suite is already open, start from the block diagram shown in and jump to step 4.

2. Open the Vivado project that you created in the introduction tutorial:

  C:/edt/edt_zcu102/edt_zcu102.xpr

3. Save the project as design_example_1:

    1. Click File → Project → Save As.
    2. Input project name design_example_1.
    3. Deselect Include run results.
    4. Click OK.
  
![](images/system_design/image1.png)

4. In the Flow Navigator, under IP integrator, click **Open Block Design** and select **edt_zcu102.bd**.

![](images/system_design/image2.png)

## Adding the AXI Timer and AXI GPIO IP

1. Adding the AXI Timer IP:

  1. Right-click in the block diagram and select Add IP from the IP catalog.
  2. In the catalog, select AXI Timer. The IP Details information displays, as shown in the following figure.

![](images/system_design/image3.png)

  3. Double-click the AXI Timer IP to add it to the design.

2. Review the AXI Timer configurations:

  1. Double-click the AXI Timer IP block to configure the IP, as shown in following figure.

![](images/system_design/image4.png)

  2. Click **OK** to close the window.

3. Add the **AXI GPIO** IP:

  1. Right-click in the block diagram and select **Add IP**.
  2. Search for “AXI GPIO” and double-click the **AXI GPIO** IP to add it to the design.

4. Add the second **AXI GPIO** IP:

  1. Copy the **axi_gpio_0** IP by typing **Ctrl+C**.
  2. Paste it by typing **Ctrl+V**.
  3. You can see that axi_gpio_1 is created.

5. Configure **axi_gpio_0** for push buttons:

  1. Double-click **axi_gpio_0** to open its configurations.
  2. Select **Push button 5bits** from the Board Interface drop-down list on the GPIO row.
  3. Click **OK**.

![](images/system_design/image5.png)

6. Configure axi_gpio_1 for PL LEDs:

  1. ouble-click axi_gpio_1 to open its configurations.
  2. Select led_8bits from the Board Interface drop-down list on the GPIO row.
  3. Click OK.

![](images/system_design/image6.png)


