{ pkgs, ... }:
{
    home.packages = with pkgs; [
        # Old setting:
        # texlive.combined.scheme-full
        # `texlive.combined.scheme-full` is deprecated; `texliveFull` is its
        # supported top-level replacement in current Nixpkgs.
        texliveFull
    ];
}