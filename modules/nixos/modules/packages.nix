{pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
  };

    users.users.frank = {
        packages = with pkgs; [
            # IDEs
            vscode-fhs
            jetbrains.idea-ultimate

            # Applications
            vesktop
            spotify
            libreoffice
            firefox

            # School and utilities
            ciscoPacketTracer8
            wireshark
            burpsuite
            ghidra
            binwalk
        ];
    };
    environment.systemPackages = with pkgs; [
        # Utilities
        home-manager
        git
        github-desktop
        wget
        file
        tree
        google-chrome
        onedriver
        neofetch
        _7zz
        inetutils
        openvpn
        curl

        # CTF tools
        sherlock
        nmap
        putty
        mysql84
        gobuster
        pwntools

        # Hyprland ecosystem
        hyprland            # Hyprland window manager
        wofi                # Application launcher
        waybar              # Status bar
        dunst               # Notification daemon
        kitty               # Terminal emulator
        xdg-desktop-portal  # Portal for Wayland apps
        xdg-desktop-portal-gtk
        wl-clipboard        # Clipboard manager for Wayland
        hyprshot            # Screenshot tool
        slurp               # Region selector for screenshots
        swww                # Wallpaper manager for Wayland
        hyprpaper		# Wallpaper manager for Wayland
        mako
        catppuccin
        firefox
        networkmanagerapplet

        # Programming utilities
        gdb
        kitty
        cool-retro-term
        python3Full
        gcc
        jdk23
        flutter
        nodejs
        vim
        neovim
        zed-editor
        sass

        # System configuration tools
        zip
        unzip
        lolcat

        # Zsh and plugins
        zsh
        autojump
        zsh-syntax-highlighting
        zsh-autosuggestions
    ];

  fonts.packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      twemoji-color-font
      font-awesome
      powerline-fonts
      powerline-symbols
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
}
