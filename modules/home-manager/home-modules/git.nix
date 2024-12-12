{
    programs.git = {
      enable = true;
      userName = "FrankStrix";
      userEmail = "matteo.francavilla@outlook.com";
      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
      extraConfig = {
        color.ui = "auto";
        push.default = "simple";
        pull.rebase = true;
        branch.autosetuprebase = "always";
        init.defaultBranch = "main";
      };
    };
}
