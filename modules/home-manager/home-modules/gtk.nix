{ pkgs, config, ... }: {
    gtk = {
        enable = true;
        font = {
        name = "Maple Mono";
        size = 12;
        };
        theme = {
        name = "Gruvbox-Green-Dark";
        package = pkgs.gruvbox-gtk-theme.override {
            colorVariants = [ "dark" ];
            themeVariants = [ "green" ];
            tweakVariants = [ "macos" ];
        };
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

    home.pointerCursor = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
    };
}
