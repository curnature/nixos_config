{ vars, ... }:

{
    programs.git = {
        enable = true;
        settings = {
            user = {
                name = vars.username;
                email = vars.userEmail;
            };
        };
        extraConfig = {
            init.defaultBranch = "main";
        };
    };
}
