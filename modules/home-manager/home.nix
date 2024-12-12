{ config, pkgs, ... }: {

  imports = [
      ./home-modules
  ];

  home.stateVersion = "24.05";  # Don't change without checking release notes
  programs.home-manager.enable = true;
}
