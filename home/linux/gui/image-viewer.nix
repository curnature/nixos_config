{ pkgs, ... }:

let
    browser = "firefox.desktop";
    imageViewer = "org.kde.gwenview.desktop";
in
{
    # Install Gwenview explicitly so this association does not depend on Plasma
    # installing it indirectly.
    home.packages = [
        pkgs.kdePackages.gwenview
    ];

    xdg.mimeApps = {
        enable = true;

        associations.added = {
            "application/x-extension-htm" = [ browser ];
            "application/x-extension-html" = [ browser ];
            "application/x-extension-shtml" = [ browser ];
            "application/x-extension-xht" = [ browser ];
            "application/x-extension-xhtml" = [ browser ];
            "application/xhtml+xml" = [ browser ];
            "text/html" = [ browser ];
            "x-scheme-handler/chrome" = [ browser ];
            "x-scheme-handler/clash" = [ "clash-verge.desktop" ];
            "x-scheme-handler/clash-verge" = [ "clash-verge.desktop" ];
            "x-scheme-handler/http" = [ browser ];
            "x-scheme-handler/https" = [ browser ];

            "image/avif" = [ imageViewer ];
            "image/bmp" = [ imageViewer ];
            "image/gif" = [ imageViewer ];
            "image/heif" = [ imageViewer ];
            "image/jpeg" = [ imageViewer ];
            "image/jxl" = [ imageViewer ];
            "image/png" = [ imageViewer ];
            "image/svg+xml" = [ imageViewer ];
            "image/svg+xml-compressed" = [ imageViewer ];
            "image/tiff" = [ imageViewer ];
            "image/webp" = [ imageViewer ];
            "image/x-webp" = [ imageViewer ];
        };

        defaultApplications = {
            "application/x-extension-htm" = [ browser ];
            "application/x-extension-html" = [ browser ];
            "application/x-extension-shtml" = [ browser ];
            "application/x-extension-xht" = [ browser ];
            "application/x-extension-xhtml" = [ browser ];
            "application/xhtml+xml" = [ browser ];
            "text/html" = [ browser ];
            "x-scheme-handler/chrome" = [ browser ];
            "x-scheme-handler/clash" = [ "clash-verge.desktop" ];
            "x-scheme-handler/clash-verge" = [ "clash-verge.desktop" ];
            "x-scheme-handler/codex" = [ "chatgpt.desktop" ];
            "x-scheme-handler/http" = [ browser ];
            "x-scheme-handler/https" = [ browser ];

            "image/avif" = [ imageViewer ];
            "image/bmp" = [ imageViewer ];
            "image/gif" = [ imageViewer ];
            "image/heif" = [ imageViewer ];
            "image/jpeg" = [ imageViewer ];
            "image/jxl" = [ imageViewer ];
            "image/png" = [ imageViewer ];
            "image/svg+xml" = [ imageViewer ];
            "image/svg+xml-compressed" = [ imageViewer ];
            "image/tiff" = [ imageViewer ];
            "image/webp" = [ imageViewer ];
            "image/x-webp" = [ imageViewer ];
        };
    };

    # Old unmanaged setting from ~/.config/mimeapps.list:
    # image/png=gwenview-3.desktop;
    # `gwenview-3.desktop` is a legacy private launcher and covered only PNG.
    # The declarations above use Gwenview's canonical desktop ID and cover the
    # common image formats without taking editor-specific formats from GIMP or Krita.
}
