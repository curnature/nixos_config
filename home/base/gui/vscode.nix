{ pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
        mutableExtensionsDir = true; # Allows you to install other extensions manually from the sidebar

        # Pre-install essential extensions
        profiles.default.extensions = with pkgs.vscode-extensions; [
            
            # vim style
            vscodevim.vim  # Since you use Neovim, you'll feel right at home!
            # andenetalexander.vim-cheatsheet
            # Note: The Catppuccin theme extension is auto-installed by the module below

            # Manually package the extension:
            (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
                mktplcRef = {
                    name = "vim-cheatsheet";
                    publisher = "andenetalexander";
                    version = "0.0.1";
                    sha256 = "sha256-V7xVIC7HVsdX4rIAntFPsr/Z94LsnKq1/I8K8DtRtNA="; # I calculated this for you
                };
            })

            # ai tools
            github.copilot
            github.copilot-chat
            anthropic.claude-code

            # nix 
            bbenoist.nix
            # latex 
            james-yu.latex-workshop
        ];

        # These settings are "locked" by Nix. 
        # You can still change other settings in the UI, but these will always reset on reload.
        profiles.default.userSettings = {
            "editor.fontFamily" = "'CommitMono Nerd Font', 'Droid Sans Mono', 'monospace', droid sans mono";
            "editor.fontSize" = 14;
            "editor.fontLigatures" = true;
            
            "window.titleBarStyle" = "custom";
            "telemetry.telemetryLevel" = "off";
            "git.confirmSync" = false;
            
            # Optional: Make the terminal background transparent to match your system
            "workbench.colorCustomizations" = {
                "terminal.background" = "#00000000";
            };

            # -----------------------------------------------------------------
            # NIX (Using bbenoist.nix + standard formatter)
            # -----------------------------------------------------------------
            # Nix standard is 2 spaces. Don't use tabs!
            "[nix]" = {
                "editor.tabSize" = 4; # I prefer 4 spaces for Nix files
                "editor.insertSpaces" = true;
                "editor.formatOnSave" = true; 
            };
            # Note: You need a formatter installed in your system packages (e.g., 'nixpkgs-fmt' or 'alejandra')
            "nix.enableLanguageServer" = true; # If you decide to add 'nil' later

            # -----------------------------------------------------------------
            # LATEX WORKSHOP (james-yu.latex-workshop)
            # -----------------------------------------------------------------
            # 1. Build Automatically: Build when you save the file
            "latex-workshop.latex.autoBuild.run" = "onSave";

            # 2. Clean Up: Delete all those annoying .aux, .fls, .log files automatically
            "latex-workshop.latex.autoClean.run" = "onBuilt";
            "latex-workshop.latex.clean.subfolder.enabled" = true; # Clean the build folder too
            
            # 3. Viewer: Keep PDF inside VS Code (Split Tab)
            # This is great for tiling WMs like Hyprland so you don't spawn floating windows.
            "latex-workshop.view.pdf.viewer" = "tab";
            
            # 4. Compiler: Use 'latexmk' (Standard, handles bibtex automatically)
            "latex-workshop.latex.recipes" = [
                {
                    name = "latexmk 🔃";
                    tools = [ "latexmk" ];
                }
            ];
            
            # 5. Output Directory (Optional but clean)
            # Use a relative directory to avoid file collisions between projects.
            # This automatically creates a "build" folder inside your project root.
            "latex-workshop.latex.outDir" = "%DIR%/build";
        };
    };

    # This module handles the theme installation and configuration automatically
    catppuccin.vscode.profiles.default = {
        enable = true;
        flavor = "mocha";
        accent = "lavender";
    };
}
