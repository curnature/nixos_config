{ pkgs, ... }:

{
    # 1. Install the Language Server Binaries Globally
    # These are the actual programs that analyze your code.
    home.packages = with pkgs; [
        nil # Nix Language Server (The brain for Nix files)
        nixpkgs-fmt # Nix Code Formatter
        # Note: Python (python3) and Fortran (fortls) come from your 
        # project's 'nix develop' shell, so we don't install them globally here.

        claude-code # Anthropic's AI assistant for code generation and help
    ];

    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
        mutableExtensionsDir = true; # Allows you to install other extensions manually from the sidebar

        # Pre-install essential extensions
        profiles.default.extensions = with pkgs.vscode-extensions; [

            # vim style
            vscodevim.vim # Since you use Neovim, you'll feel right at home!
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
            # bbenoist.nix
            jnoortheen.nix-ide

            # latex 
            james-yu.latex-workshop

            # fortran
            fortran-lang.linter-gfortran

            # python
            ms-python.python # Note: On NixOS, we rely on the open-source logic or the environment's python.

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

            "claudeCode.useTerminal" = true;

            # -----------------------------------------------------------------
            # GLOBAL INDENTATION RULES (The "4-Space" Law)
            # -----------------------------------------------------------------
            # 1. Force 4 spaces everywhere
            "editor.tabSize" = 4;

            # 2. Use spaces, not tabs (Crucial for Python/Nix)
            "editor.insertSpaces" = true;

            # 3. Stop VS Code from "guessing"
            # (Otherwise, if it opens a file with 2 spaces, it will switch to 2)
            "editor.detectIndentation" = false;


            # --- NIX IDE SETTINGS (The "Nil" setup) ---
            "nix.enableLanguageServer" = true;
            "nix.serverPath" = "nil";
            "nix.serverSettings" = {
                "nil" = {
                "formatting" = { "command" = [ "nixpkgs-fmt" ]; };
                };
            };
            # Auto-format Nix files on save
            "[nix]" = {
                "editor.defaultFormatter" = "jnoortheen.nix-ide";
                "editor.formatOnSave" = false;
                "editor.tabSize" = 4;
            };

            # --- FORTRAN SETTINGS ---
            # Tell VS Code to look for 'fortls' (Language Server) and 'gfortran'
            # These will be provided by your 'nix develop' shell.
            "fortran.fortls.path" = "fortls";
            "fortran.linter.compiler" = "gfortran";
            "fortran.formatting.formatter" = "fprettify"; # We added this to your flake too!
            # FORTRAN: 4 Spaces (Standard for Modern Fortran)
            "[fortran]" = {
                "editor.tabSize" = 4;
                "editor.formatOnSave" = true;
            };

            # FORTRAN-FREE-FORM (F90+): 
            "[fortran_modern]" = {
                "editor.tabSize" = 4;
            };


            # --- PYTHON SETTINGS ---
            # Ensure it uses the Python from the active environment
            "python.defaultInterpreterPath" = "python";
            # PYTHON: 4 Spaces (Standard)
            "[python]" = {
                "editor.tabSize" = 4;
                "editor.formatOnSave" = true;
            };

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
