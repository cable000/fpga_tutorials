
# Writing a SD Card Image

## Linux

### dd

Please note the dd tool can overwrite any partition on your machine. Please be careful when specifying the drive in the instructions below. If you select the wrong drive, you could lose data from, or delete your primary Linux partition.

  - Run df -h to see what devices are currently mounted.
  - Insert the Micro SD card into your SD card reader
  - Run df -h again.
    
The new device that has appeared is your Micro SD card. The left column gives the device name; it will be listed as something like /dev/mmcblk0p1 or /dev/sdd1. The last part (p1 or 1 respectively) is the partition number but you want to write to the whole SD card, not just one partition. You need to remove that part from the name. e.g. Use /dev/mmcblk0 or /dev/sdd as the device name for the whole SD card.

Now that you’ve noted what the device name is, you need to unmount it so that files can’t be read or written to the SD card while you are copying over the SD image.

  - Run umount /dev/sdd1, replacing sdd1 with whatever your SD card’s device name is (including the partition number).
    
If your SD card shows up more than once in the output of df due to having multiple partitions on the SD card, you should unmount all of these partitions.

  - In the terminal, write the image to the card with the command below, making sure you replace the input file if= argument with the path to your .img file, and the /dev/sdd in the output file of= argument with the right device name. This is very important, as you will lose all data on the hard drive if you provide the wrong device name. Make sure the device name is the name of the whole Micro SD card as described above, not just a partition of it; for example, sdd, not sdds1, and mmcblk0, not mmcblk0p1.
    
`sudo dd bs=4M if=pynq_image.img of=/dev/sdd`

Please note that block size set to 4M will work most of the time; if not, please try 1M, although this will take considerably longer.

The dd command does not give any information of its progress and so may appear to have frozen; it could take a few minutes to finish writing to the card.

Instead of dd you can use dcfldd; it will give a progress report about how much has been written.
