{ pkgs, ... }:

{
    programs.yazi = {
        enable = true;
        package = pkgs.yazi;
        enableBashIntegration = true;
        enableZshIntegration = true;
        # enableNushellIntegration = true;

        shellWrapperName = "y";
        
        # Changing working directory when exiting Yazi
        settings = {
            mgr = {
                show_hidden = true;
                sort_dir_first = true;
            };
        };
    };
}