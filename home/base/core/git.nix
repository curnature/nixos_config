{ ... }:
{
  programs.git = {
    enable = true;
    userName = "curnature";
    userEmail = "curnature00@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}