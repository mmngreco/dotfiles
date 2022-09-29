## Introduction

Taken and modified from this amazing project:
https://github.com/addy-dclxvi/i3-starterpack.git

## Requirements

- At least a working Desktop Environtment or Window Manager (I'm sure You
  already have it). Why? Just to make sure already have some essential packages
  like Xorg, Display Manager, Sound Mixer, Network Manager, etc.
- My recommendation is start from Xfce. It's quite minimal for a Desktop
  Environtment. And We can use some of its useful components later. Like file
  manager, text editor, power manager, clipman, task manager, or maybe its
  settings daemon.
- Willing to learn, patience, and ability to use Google for fixing problems.
- Not give up easily. 100 times error, 100 times revert, 100 times retry every
  single day until three years in a row can break your limiter :laughing:
- Some great musics for companion. I recommend You to listen [Scenes from a
  Memory](https://www.youtube.com/playlist?list=PL0tX8IvlqTFtpB-H5g_xDK2SXuDkixjva)
  album by Dream Theater.
- :coffee:

## Installation

```
i3/install
```

## Explanations of Additional Packages

- Compton is a compositor to provide some desktop effects like shadow,
  transparency, fade, and transiton.
- Hsetroot is a wallpaper handler. i3 has no wallpaper handler by default.
- URxvt is a lightweight terminal emulator, part of *i3-sensible-terminal*.
- Xsel is a program to access X clipboard. We need it to make copy-paste in
  URxvt available. Hit Alt+C to copy, and Alt+V to paste.
- Rofi is a program launcher, similar with dmenu but with more options.
- Noto Sans and M+ are my favourite fonts used in my configuration.
- Xsettingsd is a simple settings daemon to load fontconfig and some other
  options. Without this, fonts would look rasterized in some applications.
- LXAppearance is used for changing GTK theme icons, fonts, and some other
  preferences.
- Scrot is for taking screenshoot. I use it in my configuration for Print
  Screen button. I set my Print Screen button to take screenshoot using scrot,
  then automatically open it using Viewnior image viewer.

## i3status Variables

- My wireless interface is *wlp2s0* and my ethernet adapter is *enp1s0*, You can find yours by `/sbin/iwconfig` or `iwconfig` command.
- My battery id is *BAT1*, You can find yours by `ls /sys/class/power_supply/` command.
- My volume mixer is Alsa, probably also work for You. If not, You can see the manual page to configure PulseAudio.
- To use CPU temperature, You need your CPU temperature path.
If `/sys/class/thermal/thermal_zone0/temp` doesn't work try `/sys/devices/platform/coretemp.0/temp1_input`. Still doesn't work? Ask Google :yum:
- You can add more module, just read the manual page `man i3status`.

## Launching i3

Logout your current session. Then login again with i3 session.

## Some Cheatsheet

- `$super+Return exec kitty; workspace 1; focus`
- `$super+Shift+d exec i3-dmenu-desktop --dmenu="dmenu -i -fn 'Noto Sans:size=8'"`
- `$super+d exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3 -font 'Noto Sans 8'`
- `$super+Ctrl+Shift+m exec rofi-randr`
- `$super+Ctrl+Shift+x exec xrandr --auto`
- `$super+Ctrl+Shift+t exec monitor_layout`
- `$super+s exec rofi-txs`
- `$super+w exec rofi-txw`
- `$super+Ctrl+Shift+w exec rand_wallpaper`
- `$alt+Ctrl+f exec scrot $HOME/Pictures/ScreenShot_%a-%d%b%y_%H.%M.png -e 'viewnior $f'`
- `$alt+Ctrl+e exec scrot -e 'xclip -selection clipboard -t image/png -i $f'`
- `--release $alt+Ctrl+s exec scrot $HOME/Pictures/ScreenShot_%a-%d%b%y_%H.%M.png -s -e 'xclip -selection clipboard -t image/png -i $f'`
- `# $alt+Shift+Ctrl+v exec "i3-nagbar -t warning -m 'Screen Recording?' -b 'Start' 'rec_screen &' -b 'Stop' 'pkill ffmpeg'"`
- `$super+Shift+l exec i3lock -i /home/mgreco/github/mmngreco/wallpapers/7.png`
- `$super+Shift+w exec firefox; workspace 2; focus`
- `$super+Shift+c exec google-chrome`
- `$super+Shift+f exec nautilus;workspace 4;focus`
- `XF86AudioRaiseVolume exec amixer -q set Master 5%+`
- `XF86AudioLowerVolume exec amixer -q set Master 5%-`
- `XF86AudioMute exec amixer set Master toggle`
- `XF86AudioNext exec mpc next`
- `XF86AudioPrev exec mpc prev`
- `XF86AudioPlay exec mpc toggle`
- `XF86AudioStop exec mpc stop`
- `$super+c kill`
- `$super+h focus left`
- `$super+j focus down`
- `$super+k focus up`
- `$super+l focus right`
- `Ctrl+Shift+h move left`
- `Ctrl+Shift+j move down`
- `Ctrl+Shift+k move up`
- `Ctrl+Shift+l move right`
- `$super+Shift+v split h`
- `$super+Shift+h split v`
- `Ctrl+Shift+s layout toggle split`
- `Ctrl+Shift+m fullscreen toggle`
- `Ctrl+Shift+space floating toggle`
- `$alt+Ctrl+Shift+s focus mode_toggle`
- `$alt+Shift+Ctrl+h workspace next`
- `$alt+Shift+Ctrl+l workspace prev`
- `$super+Shift+1 move container to workspace 1`
- `$super+Shift+2 move container to workspace 2`
- `$super+Shift+3 move container to workspace 3`
- `$super+Shift+4 move container to workspace 4`
- `$super+Shift+5 move container to workspace 5`
- `$super+Shift+6 move container to workspace 6`
- `$super+Ctrl+greater move workspace to output right`
- `$super+Ctrl+less move workspace to output left`
- `h resize shrink width 5 px or 5 ppt`
- `j resize grow height 5 px or 5 ppt`
- `k resize shrink height 5 px or 5 ppt`
- `l resize grow width 5 px or 5 ppt`
- `Return mode "default"`
- `$super+r mode "resize"`
- `$super+1 workspace 1`
- `$super+2 workspace 2`
- `$super+3 workspace 3`
- `$super+4 workspace 4`
- `$super+5 workspace 5`
- `$super+6 workspace 6`
- `$super+Shift+r restart`
- `$super+q exec "i3-nagbar -t warning -m 'Really, exit?' -b 'Yes' 'i3-msg exit'"`
- `$super+Shift+Ctrl+q exec --no-startup-id systemctl poweroff -i, mode "default"`

## Now What??
Do some mess with the configuration file of course.
Maybe change some keybind, autostart apps, window rules, and more You can find on
[i3 official documentations](https://i3wm.org/docs/userguide.html).
And remember, my configuration is probably not suitable for You. So, I recommend You to change it.
Also, make yourself getting used with keybinds. It will activate your Ultra Instict. :joy:
```
#change volume
bindsym XF86AudioRaiseVolume exec amixer -q set Master 5%+
bindsym XF86AudioLowerVolume exec amixer -q set Master 5%+
bindsym XF86AudioMute exec amixer set Master toggle
```
I use Amixer to change my volume. If it doesn't work for You, change it with Pactl, Pamixer, or anything else.
Just ask Google how to control volume via command line.
```
# common apps keybinds
bindsym Print exec scrot 'Cheese_%a-%d%b%y_%H.%M.png' -e 'viewnior ~/$f'
bindsym $super+l exec i3lock -i ~/.wallpaper.png
bindsym $super+Shift+w exec firefox
bindsym $super+Shift+f exec thunar;workspace 3;focus
bindsym $super+Shift+g exec geany
```
I set keybind to launch my frequently used apps, you can remove what You don't need.
And add what do You need. Note : i3lock need png image


Because it has a chance to intercept your music player global keybind hotkeys.
Or maybe You can try `playerctl`. It's the common way to control media, and
supported by a lot of popular media player.

```
#autostart
exec --no-startup-id hsetroot -center ~/.wallpaper.png
exec --no-startup-id xsettingsd &
exec --no-startup-id compton -b
```

Maybe You want to add some programs to your autostart, like network manager
applet, clipboard manager, power manager, conky, and some goodies. Probably
your network manager applet is nm-applet. So, if want to use it, add `exec
--no-startup-id nm-applet`. It will be loaded on next login. I don't put it on
my autostart, because usually I only launch it from terminal when I want to
switch SSID. And if You come from Xfce maybe You want use its setting daemon.
Replace `exec --no-startup-id xsettingsd &` with `exec --no-startup-id
xfsettingsd &`. You will have some Xfce advantage, like mouse settings,
appearance settings (LXAppearance will be overiden by this), font settings, and
some other advantage. But it will cost a thing, slightly reduce the
performance.

That's my window rules. I use it to group apps on several workspace.

- Workspace 1 for Terminals
- Workspace 2 for Web
- Workspace 3 for File Manager
- Workspace 4 for Office
- Workspace 5 for Multimedia
- Workspace 6 for Settings
