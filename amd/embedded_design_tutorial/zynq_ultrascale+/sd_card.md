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
  ```
  - Last sector, +sectors or +size{K,M,G,T,P} (2048-62333951, default 62333951): 21111220

  Creates a new partition 1 of type 'Linux' and of size 10.1 GB. Partition #1 contains a vfat signature.





    
