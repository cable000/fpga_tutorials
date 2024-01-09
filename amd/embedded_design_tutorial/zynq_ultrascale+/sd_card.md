# Partititon and Formatting an SD Card


For partitioning and formatting an SD card, the following tools are required:

  - fdisk
  - mkfs
The steps and logs for partitioning are as follows:

  - `sudo fdisk /dev/sdb`

  ```
  Welcome to fdisk (util-linux 2.31.1).
  Changes will remain in memory only, until you decide to write them.
  Be careful before using the write command.
  ```

  - `Command (m for help): n`

  Partition type

    - p primary (0 primary, 0 extended, 4 free)
    - e extended (container for logical partitions)
    
  - `Select (default p): p`

  ```
  Partition number (1-4, default 1):
  First sector (2048-62333951, default 2048):
  Last sector, +sectors or +size{K,M,G,T,P} (2048-62333951, default 62333951): 21111220
  ```
  Make sure you have two partitions and write this configuation

  - `Command (m for help): w`

    ```
    The partition table has been altered.
    Calling ioctl() to re-read partition table.
    Syncing disks.
    Steps and log for formatting:
    ```

  Make the first partition a FAT32 partition and the second a ext4 partition

  - `$ sudo mkfs.vfat /dev/sdb1`

    `mkfs.fat 4.1 (2017-01-24)`

  - `$ sudo mkfs.ext4 /dev/sdb2`

    ```
    mke2fs 1.44.1 (24-Mar-2018)
    Creating file system with 5152640 4k blocks and 1289280 inodes
    File system UUID: ad549f34-ee6e-4efc-ab03-fba390e98ede
    Superblock backups stored on blocks:
    32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 4096000
    Allocating group tables: done
    Writing inode tables: done
    Creating journal (32768 blocks): done
    Writing superblocks and file system accounting information: done
    ```

Mount the fat partition and copy BOOT.BIN, boot.scr, Image, and system.dtb files on it.
Mount the EXT partition and untar rootfs.tar.gz to it.
Finally unmount the SD card and use it for booting.

# Steps to Flash and Boot the PetaLinux Images Manually
  1. Copy the following files from <plnx-proj-root>/images/linux or <plnx-proj-root>/pre-built/linux/images/ into the root directory of the first partition, which is in FAT32 format in the SD card:
    - BOOT.BIN
    - image.ub
    - boot.scr
  2. Extract the rootfs.tar.gz folder into the ext4 partition of the SD card.
  3. Connect the serial port on the board to your workstation.
  4. Open a console on the workstation and start the preferred serial communication program (For example: kermit, minicom, gtkterm) with the baud rate set to 115200 on that console.
  5. Power off the board.
  6. Set the boot mode of the board to SD boot. Refer to the board documentation for details.
  7. Plug the SD card into the board.
  8. Power on the board.
  9. A boot message displays on the serial console.
    




    
