{ vars, ... }:

{
    # Note: We DO NOT import ./base or ./linux here.
    # The "Profile" file (linux/gui.nix) handles the imports!

    home = {
        username = vars.username;
        homeDirectory = "/home/${vars.username}";
        stateVersion = vars.stateVersion;
        sessionVariables = { NIXOS_OZONE_WL = "1"; }; # Forces Electron apps (VS Code, QQ, WeChat, Obsidian) to use Wayland
    };

    # Let Home Manager manage itself
    programs.home-manager.enable = true;
}