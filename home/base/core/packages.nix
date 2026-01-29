{ pkgs, inputs, ... }: 
{
  # Allow unfree packages (Chrome, etc.)
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # System Tools
    lm_sensors
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

    # Fonts
    nerd-fonts.cousine
    nerd-fonts.commit-mono

    # NixVim (From Flake Inputs)
    #inputs.nixvim.packages.${pkgs.system}.default
  ];
}