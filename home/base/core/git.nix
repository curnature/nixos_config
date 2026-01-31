{ vars, ... }:

{
    programs.git = {
        enable = true;

        ignores = [
            "build/"      # Ignore the LaTeX build folder everywhere
            "*.aux"       # Just in case one escapes
            "*.fdb_latexmk"
            "*.fls"
            "*.log"
        ];
        
        settings = {
            user = {
                name = vars.username;
                email = vars.userEmail;
            };
            
            init.defaultBranch = "main";
        };
   };
}
