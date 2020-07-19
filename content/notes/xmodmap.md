+++
title = "xmodmap"
+++


How to customize keyboard modifier keys in X (e.g. xorg) under [Linux]({{< ref "Linux" >}}) or [OpenBSD]({{< ref "OpenBSD" >}}).

Keys are identified by codes. E.g. caps lock is `66`. Find out keys by running `xev`
Modifiers are abstract mappings between modifier names and particular keys. `xmodmap` 

```
mod1	Alt_L, Meta_L
mod2	Num_Lock
mod3	Hyper_R
```

Mapping can be changed by passing a config file to `xmodmap`. This example does the following:

- Caps Lock -> Left Control
- Left Control stays
- Left Win -> Left Alt
- Left Alt -> Left Win
- Right Alt -> Right Hyper

```
clear Lock
clear Control
keycode 66 = Control_L
keycode 37 = Control_L
keycode 109 = Control_R

clear mod1
clear mod3
clear mod4
keycode 113 = Hyper_R
keycode 115 = Alt_L
keycode 64 = Super_L

add mod1 = Alt_L Meta_L
add mod3 = Hyper_R
add mod4 = Super_L Super_R
add Control = Control_L Control_R
```

Add this to `.xsession` to load the mappings when X starts:

```
setxkbmap
xmodmap ~/.xsession
```

