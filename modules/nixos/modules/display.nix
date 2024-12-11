{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      xkb.layout = "it";
    };
    libinput.enable = true;
    printing.enable = true;

    # Desktop environment
    desktopManager.plasma6.enable = true;
    displayManager = {
      enable = true;
      autoLogin = {
        enable = false;
        user = "frank";
      };
    };
  };
    xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
