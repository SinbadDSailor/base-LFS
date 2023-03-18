# Linux From Scratch semi-automatic build

The script was created as a consequence of the process of learning the Linux operating system and its deeper understanding.

*Please note: The script is not completely original, but a combination of instructions from [Write your own Operating System](https://www.youtube.com/@writeyourownoperatingsystem) and [Kernotex](https://www.youtube.com/@Kernotex) with personal changes to the instructions.

## About

**LFS version: LFS-11.3**

The main script is lfs-main.sh. Mandatory variables are declared in it and scripts are executed in order by chapter. The script can be started and wait for the complete execution of the process, which can take several hours (it depends on the speed of the processor), it is recommended to comment everything, and then execute the scripts chapter by chapter.

**File tree:**
* disk-setup.sh > Disk formatting using fdisk, file system and swap creation.
* download.sh > Downloading all necessary packages.
* package-install.sh > Compilation and installation of required packages.
* packages.csv > A collection of all information about required packages.
* version-check.sh > Copied script from LFS book.
* pre-chroot.sh and quit-chroot.sh > Settings required before entering and exiting chroot environment.
* chroot-bash.sh > Automated chroot entry.
* in-chroot*.sh > Collections of commands that are executed in the chroot environment.


## Important settings

SYSTEMFLAG > Options are SV (sysvinit) or SD (systemd). Choose an option depending on whether you want to build the system with systemvinit or systemd.

``` bash
export SYSTEMFLAG="SV"
```

LFS_DISK > Write the disk on which the LFS system will be built.
MAKEFLAGS > Enter the number of processor cores to speed up the compilation process.

``` bash
export LFS_DISK=/dev/sdb
export MAKEFLAGS='-j4'
```

The MAKEFLAGS variable can be set to automatically determine the number of cores using the command: 
``` bash 
export MAKEFLAGS="-j $(grep -c ^processor /proc/cpuinfo)"
```

disk-setup.sh > The input commands for fdisk can be modified as needed. For example, you can put more swap memory or partition the disk completely differently.

In the chapter* subfolders there are scripts with compiled commands from the book that have not been changed.

Other changes in in-chroot scripts should be done according to the instructions in the book.

Installation of packages in the chroot environment, from in-chroot4.sh can be done at once, but it is recommended to enter the chroot environment, and then from the sources directory, run the command with a smaller number of packages:
``` bash
(lfs chroot) root:/sources$ for package in man-pages iana-etc glibc; do source packageinstall.sh 8 $package done
```

***Please note:** The script has successfully built an LFS system on an additional hard disk, if the system is being built on a USB stick GRUB should be installed according to the instructions from BLFS with UEFI boot.
