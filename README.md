# ❄️ Nix Config ❄️

This repository is home to the nix code that builds my systems. 

## Why NixOS & Flakes?

Nix allows for easy-to-manage, collaborative, reproducible deployments. This means that once something is setup and configured once, it works (almost) forever. By using Flakes, I can strictly lock my dependencies and instantly spawn reproducible development environments. 

## Components

| Category | Software |
| :--- | :--- |
| **Window Manager** | Niri / Hyprland (with KDE Plasma available) |
| **Terminal Emulator** | Kitty |
| **Shell** | Zsh + Fastfetch |
| **Bar / UI** | Waybar / Noctalia |
| **Color Scheme** | Catppuccin |
| **Input Method** | Fcitx5 |
| **System Monitor** | Btop |
| **File Manager** | Yazi |
| **Text Editor** | Neovim (Standalone Flake) / VS Code |
| **Media** | mpv |

## 🔴 IMPORTANT: You should NOT deploy this flake directly on your machine ❗

It will not succeed. This flake contains my specific hardware configuration (such as `omen/hardware-configuration.nix` and Nvidia support) which is almost certainly not suitable for your hardware. 

You may use this repo as a reference or a template to build your own configuration. I highly recommend reading through the `outputs/` and `home/` directories to see how the modular architecture works.

## How to Deploy this Flake?

If you are using this as a reference and have swapped out my `hosts/omen` hardware configuration for your own, you can deploy it using standard NixOS commands.

```bash
# Update the lockfile to pull the latest packages
nix flake update

# Deploy the configuration based on the hostname
sudo nixos-rebuild switch --flake .#omen