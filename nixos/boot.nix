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
                rev = "5815dd4263fcf32db248ac67d628dd9319ba1f60";
                sha256 = "158qvws8s7jmw1w8lqimdvbwmmhi5hswwl1vhysn7rqvp7pbbp3n";

                # owner = "tsssni";
                # repo = "plana.grub";
                # rev = "31272f17529ae693eba311ac556e91a2660242f1";
                # sha256 = "sha256-N9uyk88QtIlG15kveiOF/Yh8E/frEwWbT3kB5PEvq3M=";
            };
        };
    };
}
