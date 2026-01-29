{ pkgs, vars, ... }:

{
    # Define a user account.
    # Don't forget to set a password with ‘passwd’.
    users.users.${vars.username} = {
        isNormalUser = true;
        description = vars.username;
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
            kdePackages.kate
            # thunderbird
        ];
    };

    # Enable automatic login for the user.
    services.displayManager.autoLogin = {
        enable = false;
        user = vars.username;
    };
}