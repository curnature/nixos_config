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
        owner = "tsssni";
        repo = "plana.grub";
        rev = "31272f17529ae693eba311ac556e91a2660242f1";
        sha256 = "sha256-N9uyk88QtIlG15kveiOF/Yh8E/frEwWbT3kB5PEvq3M=";
      };
    };
  };
}