# river-paper-dark-theme

A sample configuration and theme for [river](https://github.com/ifreund/river), a tiling window manager for wlroots based Wayland compositors written in [Zig](https://github.com/ziglang/zig/).

## Quick Installation

```sh
git clone https://github.com/uncomfyhalomacro/river-paper-dark-theme
cd river-paper-dark-theme
./install.sh
```

## Prerequisites

You must have the following software in order to make this work:

- Spotify (for added waybar spice)
- [playerctl](https://github.com/altdesktop/playerctl) (needed for playback stuff. Available usually in the official repositories)
- [river-tag-overlay](https://git.sr.ht/~leon_plickat/river-tag-overlay) (for showing pop-ups about the currently focused and occupied tags)
- [stacktile](https://git.sr.ht/~leon_plickat/stacktile)
- [yambar](https://codeberg.org/dnkl/yambar) (lightweight bar)
- [mako](https://github.com/emersion/mako) (a notification daemon for wayland)
- [foot](https://codeberg.org/dnkl/foot) (a native wayland terminal emulator)
- [fuzzel](https://codeberg.org/dnkl/fuzzel) (a rofi inspired application launcher)
- Install a Nerd Font.

Then either copy `wayriver.sh` to somewhere you want (e.g. $HOME) so you can start river there, assuming you are not using a login display manager such as SDDM or LightDM.
Otherwise, create a desktop file named `river.desktop` and add it to `/usr/local/share/wayland-sessions` or `/usr/share/wayland-sessions`. Some distros do not allow you to add or write stuff in `/usr` but allows you to do in `/usr/local`.

Now you can start your wayland session in river by either in your login display manager or using the script `wayriver.sh` if you use seatd or `river-run.sh` if you are using elogind.

**IMPORTANT**

Recheck the script. The script uses dash because the configuration was assumed that your default shell is dash. I was using Void Linux when I was writing this script and Void defaults to dash. Adjust to your default user shell accordingly. Also check yambar config and edit path. Yambar cannot use env vars such as `$HOME` at this moment.

**Screenshots**

![Image](https://github.com/uncomfyhalomacro/river-paper-dark-theme/blob/main/screenshots/screenshot_01.png)
![Image](https://github.com/uncomfyhalomacro/river-paper-dark-theme/blob/main/screenshots/screenshot_02.png)
![Image](https://github.com/uncomfyhalomacro/river-paper-dark-theme/blob/main/screenshots/screenshot_03.png)
