# ❄️ Nix Config ❄️

This repository is home to the nix code that builds my systems, with AI assistant. 

## 🙏 Acknowledgements

This configuration wouldn't be possible without the incredible Nix community. Special thanks to:

* 🌟 **[Ryan](https://nixos-and-flakes.thiscute.world/introduction/)**: For his amazing [modular nixos template](https://github.com/ryan4yin/nix-config) and documentation.
* 🐧 **[Vimjoyer](https://www.youtube.com/@vimjoyer/videos)**: For the fantastic video guides that led me into the world of Nix and Linux.
* 🫂 **The Open Source Community**: To whoever shares their knowledge with the public!

## Components

| Category | Software |
| :--- | :--- |
| **Window Manager** | Niri |
| **Terminal Emulator** | Kitty |
| **Shell** | Zsh + Fastfetch |
| **Bar / UI** | Noctalia |
| **Color Scheme** | Catppuccin |
| **Input Method** | Fcitx5 |
| **System Monitor** | Btop |
| **File Manager** | Yazi |
| **Text Editor** | Neovim [(Standalone Flake)](https://github.com/curnature/NvimFlake) / VS Code |
| **Media** | mpv |

## 🔴 IMPORTANT: You should NOT deploy this flake directly on your machine ❗

It will not succeed. This flake contains my specific hardware configuration (such as `omen/hardware-configuration.nix` and Nvidia support) which is almost certainly not suitable for your hardware. 

You may use this repo as a reference or a template to build your own configuration. I highly recommend reading through the `outputs/` and `home/` directories to see how the modular architecture works.

## 🛠️ Step-by-Step Guide to Adapting this Flake

If you want to use this repository as a starting point for your own machine, follow these steps to safely adapt it to your hardware and user profile.

### Step 1: Clone the Repository
Clone this repository to your local machine. Let's say you want to put this under `~/nixos_config`:
```bash
git clone https://github.com/curnature/nixos_config.git ~/nixos_config
cd ~/nixos_config
```

### Step 2: Generate Your Hardware Configuration
Do not use my `omen` hardware config. Generate the specific hardware mappings for your own motherboard, CPU, and file systems:
```bash
nixos-generate-config --show-hardware-config > hardware-configuration.nix
```

### Step 3: Create Your Host Profile
Duplicate my host template and replace the hardware file with the one you just generated:
```bash
# Create a folder for your machine (e.g., replace 'my-machine' with your hostname)
cp -r hosts/omen hosts/my-machine

# Move your freshly generated hardware config into this new folder
mv hardware-configuration.nix hosts/my-machine/hardware-configuration.nix
```
Note: Be sure to open `hosts/my-machine/default.nix` and remove any omen-specific quirks (like my Nvidia driver settings) if they do not apply to your machine!

### Step 4: Update Global Variables
Open `vars/default.nix` and change the username string to match your actual Linux user account.

### Step 5: Register Your New Host
Open `outputs/default.nix` and add your new machine to the `nixosConfigurations` block so the flake knows how to build it:
```nix
nixosConfigurations = {
    # My Machine
    omen = mkSystem "omen"; # <-- REPLACE THIS WITH YOUR OWN ONES
        
    # Your Machine
    my-machine = mkSystem "my-machine"; # <-- ADD YOURS HERE
};
```

### Step 6: Deploy!
Because Nix flakes only read files that are tracked by Git, you must add your new files before building.
```bash
# 1. Track your new host folder in Git
git add .

# 2. Update the lockfile to pull the latest packages
nix flake update

# 3. Build and apply the configuration (replace 'my-machine' with your hostname)
sudo nixos-rebuild switch --flake '.#my-machine'
```
💡 **Tip:** *If you get any error message, don't panic! It is a great time to ask ChatGPT or Gemini to help you decode it.*
