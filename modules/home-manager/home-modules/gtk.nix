{ pkgs, config, ... }: {
    gtk = {
        enable = true;
        font = {
          name = "Maple Mono";
          size = 12;
          };
        iconTheme = {
   	  name = "Papirus-Dark";
  	  package = pkgs.papirus-icon-theme.override { color = "black"; };
        };
        cursorTheme = {
          name = "Bibata-Modern-Ice";
          package = pkgs.bibata-cursors;
          size = 24;
    };
  };
}
