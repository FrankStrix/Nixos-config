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
    displayManager.sddm = {
      wayland.enable = true;
    };
  };
    xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
