{ pkgs, ... }:

{
    # 1. Enable Vim
    programs.vim = {
        enable = true;
        defaultEditor = true; # Sets EDITOR=vim
    };

    # 2. Link your config file
    # This tells Home Manager: "Take my local file ./vim/.vimrc and put it at ~/.vimrc"
    home.file.".vimrc".source = ./vim/.vimrc;
}