+++
title = "OpenBSD initial setup"
+++


A few essential steps after a fresh install of [OpenBSD]({{< ref "OpenBSD" >}}):

## doas

`echo 'permit persist keepenv :wheel' >> /etc/doas.conf`

## User and limits

`usermod -G staff YOUR_USERNAME`

Edit `/etc/login.conf`:

```
staff:\
  :datasize-cur=1024M:\
  :datasize-max=8192M:\
  :maxproc-cur=512:\
  :maxproc-max=1024:\
  :openfiles-cur=4096:\
  :openfiles-max=8192:\
  :stacksize-cur=32M:\
  :ignorenologin:\
  :requirehome@:\
  :tc=default:
```

## Wifi
Assuming the ethernet was configured during install, wifi may require downloading proprietary firwmare:

```
fw_update
```

Then edit `/etc/hostname.iwm0`:

```
join Home wpakey p@ssw0rd
dhcp
up
```

and

```
chown root:wheel /etc/hostname.iwm0
chmod 0640 /etc/hostname.iwm0
sh /etc/netstart
```

See also: 

- [Connect to Wi-Fi and Ethernet networks from OpenBSD](https://rgz.ee/m/on.html)
- [D5Nch3ck/wifi-menu: OpenBSD Wireless Network Manager](https://github.com/D5Nch3ck/wifi-menu)

## Intel drivers
Edit `/etc/xorg.conf`

```
Section "Device"
        Identifier "Intel HD Graphics 4000"
        Driver "intel"
		Option "TearFree" "true"
EndSection
```

## X

Edit `/etc/X11/xenodm/Xsetup_0`:

```
#!/bin/sh
xsetroot -solid black
```

## Power management

Enable `apmd` and set it to automatic adjustment with auto suspend at 7% battery:

```
rcctl enable apmd
rcctl set apmd flags -A -z 7
rcctl start apmd
```

### References
1. [OpenBSD Machine Setup - Rex Flex](https://rexflex.net/articles/openbsd-machine-setup/)
2. [OpenBSD on a Laptop](https://www.c0ffee.net/blog/openbsd-on-a-laptop/)
3. [Customizing OpenBSD xenodm - TuM'Fatig](https://www.tumfatig.net/20190208/customizing-openbsd-xenodm/)