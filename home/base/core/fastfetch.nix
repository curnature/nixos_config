{ pkgs, ... }:

{
    home.packages = [ pkgs.fastfetch ];

    xdg.configFile."fastfetch/config.jsonc".text = ''
        {
            "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
            "logo": {
                "source": "nixos",
                "padding": {
                    "right": 1
                }
            },
            "modules": [
                "title",
                "separator",
                "os",
                "host",
                "kernel",
                "uptime",
                "packages",
                "shell",
                "display",
                "de",
                "wm",
                // Previous setting: Fastfetch's pretty name misparses VS Code's
                // process title on NixOS. Use the process name without its flags.
                // "terminal",
                {
                    "type": "terminal",
                    "format": "{process-name} {version}"
                },
                "terminalfont",
                "cpu",
                "gpu",
                "memory",
                "disk",
                "localip",
                "battery",
                "poweradapter",
                "break",
                "colors"
            ]
        }
    '';
}
