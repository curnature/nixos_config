{ pkgs, username, ... }:

{
  # Define a user account.
  # Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      # thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin = {
    enable = false;
    user = "${username}";
  };
}