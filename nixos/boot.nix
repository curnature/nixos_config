{ pkgs, ... }:

{
    boot.loader = {
        # Generic timeout for all bootloaders (replaces grub.timeout)
        timeout = 60;

        efi = {
            canTouchEfiVariables = true;
        };

        grub = {
            enable = true;
            devices = [ "nodev" ];
            efiSupport = true;
            useOSProber = true;
            configurationLimit = 10;

            # Custom GRUB Theme
            # theme = pkgs.fetchFromGitHub {
                # owner = "curnature";
                # repo = "grub";
                # rev = "abb4e0f5863ed45a047b2daf74d268fa069855f8";
                # sha256 = "1c5ggmqm4xi654xxabxx7gj22qh6w1y14fhhbzrjch5fxk8y83ag";
                # rev = "78e518ba69e4672e8e1e5191f2f7089527acb379";
                # sha256 = "0gq2qvhi5zqvs44dfrqrq4074ahjc5gcwkhmgdnvxxkw5byb9q0p";

                # owner = "tsssni";
                # repo = "plana.grub";
                # rev = "31272f17529ae693eba311ac556e91a2660242f1";
                # sha256 = "sha256-N9uyk88QtIlG15kveiOF/Yh8E/frEwWbT3kB5PEvq3M=";
            # };

            theme = let
                # 1. Fetch the master repository containing all resolutions
                baseTheme = pkgs.fetchFromGitHub {
                    owner = "curnature";
                    repo = "grub";
                    rev = "abb4e0f5863ed45a047b2daf74d268fa069855f8";
                    ha256 = "1c5ggmqm4xi654xxabxx7gj22qh6w1y14fhhbzrjch5fxk8y83ag";
                };

                # 2. Check the hostname to pick the correct config file
                targetThemeTxt = if config.networking.hostName == "omen" 
                    then "theme_1440.txt" 
                    else "theme_1920.txt"; # The new laptop
            in 
                # 3. Build the final theme package dynamically
                pkgs.runCommand "dynamic-grub-theme" {} ''
                    mkdir -p $out
      
                    # Copy everything from the fetched GitHub repo into our new package
                    cp -r ${baseTheme}/* $out/
      
                    # Replace the default theme.txt with the resolution-specific one
                    cp $out/${targetThemeTxt} $out/theme.txt
                '';
        };
    };
}
