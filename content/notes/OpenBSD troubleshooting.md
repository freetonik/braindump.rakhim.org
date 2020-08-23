+++
title = "OpenBSD troubleshooting"
+++


Fix problems in [OpenBSD]({{< ref "OpenBSD" >}}).

## Single user mode
To boot into single user mode, run this athe initial timeout prompt:

```
boot -s
```

Check and mount drives:

```
fsck -p
mount -a
```

Set shell and terminal:

```
/bin/ksh
export TERM=xterm
```

now `vi` should work.