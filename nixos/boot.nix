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
            theme = pkgs.fetchFromGitHub {
                owner = "curnature";
                repo = "grub";
                rev = "78e518ba69e4672e8e1e5191f2f7089527acb379";
                sha256 = "0gq2qvhi5zqvs44dfrqrq4074ahjc5gcwkhmgdnvxxkw5byb9q0p";

                # owner = "tsssni";
                # repo = "plana.grub";
                # rev = "31272f17529ae693eba311ac556e91a2660242f1";
                # sha256 = "sha256-N9uyk88QtIlG15kveiOF/Yh8E/frEwWbT3kB5PEvq3M=";
            };
        };
    };
}
