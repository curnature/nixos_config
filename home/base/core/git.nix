{ vars, ... }:

{
    programs.git = {
        enable = true;
        settings = {
            user = {
                name = vars.username;
                email = vars.userEmail;
            };
            
            init.defaultBranch = "main";
        };
   };
}
