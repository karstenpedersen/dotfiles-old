# Dotfiles

My personal dotfiles based around NixOS with home-manager using hyprland.

## Tooling

|                          |                  NixOS 23.11               |
|--------------------------|:------------------------------------------:|
| **Tiling Compositor**    | [Hyprland](https://hyprland.org)           |
| **Terminal**             | [Kitty](https://sw.kovidgoyal.net/kitty/)  |
| **Display Server**       | [Wayland](https://wayland.freedesktop.org) |
| **Application Launcher** | [Rofi](https://github.com/davatorium/rofi) |
| **Shell**                | [Zsh](https://zsh.sourceforge.io)          |
| **Text Editor**          | [Neovim](https://neovim.io)                |
| **File Manager**         | [lf](https://github.com/gokcehan/lf)       |

## Get Started

```
# Clone repository
git clone git@github.com:karstenpedersen/dotfiles.git
cd dotfiles

# Make install.sh executable
chmod +x install.sh

# Build NixOS and home-manager
./install.sh
```
