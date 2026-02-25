{ pkgs, inputs, ... }: 

{
    # Allow unfree packages (Chrome, etc.)
    # nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        # System Tools
        unzip
        zip

        # Media
        ffmpeg
        ffmpegthumbnailer
        imagemagick

        # Network / Web
        curl
        nurl
        #google-chrome

        # Git / Dev
    
        # Nix Tools
        nix-prefetch
        nix-prefetch-scripts
        nix-prefetch-github

        # Fun
        pay-respects

        
        # VSCode exteision requirements
        nixpkgs-fmt # for formatting nix files
    ];
}
