{ pkgs, ... }:

{
    home.packages = with pkgs; [
        ripgrep     # Blazing fast search (rg)
        fd          # Better find
        tldr        # Community man pages
        delta       # Better git diff viewer
        git-graph   # Terminal git graph

        # fastfetch   # System info fetcher in /base/core/fastfetch.nix
        cmatrix     # Matrix rain
        cbonsai     # Terminal bonsai tree generator
    ];
}