{
  config,
  pkgs,
  ...
}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/frank/Immagini/Wallpaper-Bank/wallpapers/Fantasy-Landscape2.png" ];
      wallpaper = [ "/home/frank/Immagini/Wallpaper-Bank/wallpapers/Fantasy-Landscape2.png" ];

      ipc = "on";
      splash = false;
      splash_offset = 2.0;
    };
  };
}
