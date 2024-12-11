{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";  # Don't change without checking release notes

  # User packages
  home.packages = [
    pkgs.vscodium
    pkgs.git
    pkgs.kitty
    pkgs.neovim
    pkgs.zsh
    pkgs.autojump
    pkgs.zsh-syntax-highlighting
    pkgs.zsh-autosuggestions
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
    BROWSER = "google-chrome";
    TERMINAL = "kitty";
  };

  programs = {
    git = {
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

    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };

    kitty = {
      enable = true;
    };
  };

  programs.home-manager.enable = true;
}
