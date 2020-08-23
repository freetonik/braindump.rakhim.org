+++
title = "OpenBSD"
+++


## Help
- `man bla`
- `apropos bla` finds all man pages with bla in name or description
- `whatis bla` matches only whole words

## Partitions

1. MBR partitions
2. Disklabel partitions (or just partitions)

### MBR partitions

Every HD has 4 MBR partitions. In most cases, 1 has space allocated, the other 3 are 0 bytes. If multiple Oses are to be installed, each needs its own MBR.

One disklabel can support 16 partitions. If you need more than 16 par- titions, you must create a second MBR partition and add more disklabels.

`fdisk` is used to manage MBR. Each os has its own `fdisk`.

### Standard OpenBSD disklabel partitions
- `/` (root). OS configuration files, essential software for single-user mode and networking. This needs to be on the fastest access drive.
- swap space. Virtual memory. Also used during system failures. Must be at least the size of RAM. Consider future RAM upgrades.
- `/tmp`. Temp files. Installers dumn into it often.
- `/var`. Frequently changing data: logs, dbs, mail spools, temp run files, websites. Must be larger than default ~5Gb if used for live server.
- `/usr`. OS programs, compilers, libraries, add-ons. Mostly changes only when OS is upgraded. ~2Gb by default, probably okay even for desktop.
	- `/usr/X11R6`. X window system and docs. 
	- `/usr/local`. Add-on software, usually from packages.
	- `/usr/src`. OpenBSD source code.
	- `/usr/obj`. Space for building new versions of OS and Xenocara. Files are temporary, don't need to save them when a new OS version is installed. Creating a new filesystem is faster than erasing the individual files in this kind of filesystem, so /usr/obj is configured as its own partition.
- `/home`. For everything else, basically. User dirs.

## Filesystem
OpenBSD uses the standard FFS (Fast File System) by default. Supports up to 1TB disks. FFS2 is used for larder disks.

## Sectors and Disklabels
Physical info:

```
# /dev/rsd0c:
vtype: SCSI
wdisk: SCSI disk 
xlabel: DSA2CW120G3 
yduid: adb697598fa0a010
flags: 
   zbytes/sector: 512
   sectors/track: 63
   tracks/cylinder: 255
   sectors/cylinder: 16065
   cylinders: 14593
total sectors: 234441648 
boundstart: 64 
boundend: 234436545
drivedata: 0
```

- `/dev/rsd0c`
	- `dev` device node
	- `sd` device driver (`sd(4)`)
	- `0` the first drive found and attached by OpenBSD
	- `r` raw mode
	- `c` disklabel partition
- `vtype`
	- any IDE disk will show as `ESDI`
	- any SCSI, SAS, SATA and others will show as `SCSI`
- `xlabel` manufacturer’s name and/or the drive model number
- `yduid` shows unique DUID
- bytes per sector, sectors per track, tracks per cylinder and sectors per cylinder are false
- `total sectors` is true
- `boundstart` first sector available to disklabel partitions
- `boundend` last sector available to disklabel partitions

---

Paritition info:
- labels go a, b, c, d, e ...
- label c is virtual, represents whole disk (offset of 0 and a size equal to the number of sec- tors on the disk)

---

Cisklabel can be considered a configuration file for formatting a disk. One could save this disklabel to a file, get an identical hard drive, write this label to that new disk, and perfectly duplicate the partitioning of the old disk on the new.

## Boot
After the kernel finished initial setup, it hands over the control of the system to userland. `init(8)` runs the shell script `/etc/rc`:

- starts programs
- network config
- server software startup

Configureable via `/etc/rc.conf` and `/etc/rc.conf.local`. The local overried the default. Conf files contain shell script variable assignments that control what `/etc/rc` runs and the command-line options for the various programs.

Most vars have one of 3 values:

1. `NO`. Disable. E.g. `ntpd_flags=NO` disables the NTP daemon. 
2. Command line flag e.g. `"-s"`. E.g. `ntpd_flags="-s"`
3. `""` (empty). Starts without args. E.g. `ntpd_flags=""`


## Time and date


## Resources
- [Hitchhiker's Guide to OpenBSD](http://130.79.200.5/OpenBSD/doc/history/obsd-faq49.txt)
- [OpenBSD Journal: A resource for the OpenBSD community](https://undeadly.org/cgi?action=front)
- [Well, it’s been a while – falling in love with OpenBSD again | FunctionallyParanoid.com](https://functionallyparanoid.com/2019/03/13/well-its-been-a-while-falling-in-love-with-openbsd-again/)
- [OpenBSD Jumpstart](https://www.openbsdjumpstart.org/#/)

---
## Backlinks
* [OpenBSD initial setup]({{< ref "OpenBSD initial setup" >}})
	* A few essential steps after a fresh install of [OpenBSD]({{< ref "OpenBSD" >}}):
* [OpenBSD troubleshooting]({{< ref "OpenBSD troubleshooting" >}})
	* Fix problems in [OpenBSD]({{< ref "OpenBSD" >}}).
* [Thinkpad]({{< ref "Thinkpad" >}})
	* A good, serviceable laptop with excellent [Linux]({{< ref "Linux" >}}) support. [OpenBSD]({{< ref "OpenBSD" >}}) also works perfectly fine on it. 
* [xmodmap]({{< ref "xmodmap" >}})
	* How to customize keyboard modifier keys in X (e.g. xorg) under [Linux]({{< ref "Linux" >}}) or [OpenBSD]({{< ref "OpenBSD" >}}).

