{ pkgs, inputs, ... }: 

{
    # Allow unfree packages (Chrome, etc.)
    # nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        # System Tools
        unzip
        zip
        ripgrep
        fd
        tldr
        eza         # ls replacement
        bat         # cat replacement
        delta       # git diff viewer
        zoxide      # cd replacement
        fzf         # fuzzy finder

        # Media
        ffmpeg
        ffmpegthumbnailer
        imagemagick

        # Network / Web
        curl
        nurl
        #google-chrome

        # Git / Dev
        git-graph
        gh          # GitHub CLI
    
        # Nix Tools
        nix-prefetch
        nix-prefetch-scripts
        nix-prefetch-github

        # Fun
        pay-respects


        # Replace NixVim with VSCode, no need to configure Neovim if VSCode can do it all
        # NixVim (From Flake Inputs)
        #inputs.nixvim.packages.${pkgs.system}.default

        # VSCode exteision requirements
        nixpkgs-fmt # for formatting nix files
    ];
}
