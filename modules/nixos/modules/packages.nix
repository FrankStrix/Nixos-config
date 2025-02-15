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

            # School and utilities
            ciscoPacketTracer8
        ];
    };
    environment.systemPackages = with pkgs; [
        # Utilities
        home-manager
        wget
        file
        tree
        google-chrome
        onedrive
        neofetch
        _7zz
        inetutils
        openvpn
#	ghostty

	# Themes
	sddm-astronaut

	# Package managers
	pacman
	apt
	
	# Screensavers
	pipes

        # CTF tools
        sherlock
        nmap
        putty
        mysql84
        gobuster

        # Hyprland ecosystem
#        hyprland            # Hyprland window manager
#        wofi                # Application launcher
#        waybar              # Status bar
#        dunst               # Notification daemon
#        kitty               # Terminal emulator
#        xdg-desktop-portal  # Portal for Wayland apps
#        xdg-desktop-portal-gtk
#        wl-clipboard        # Clipboard manager for Wayland
#        hyprshot            # Screenshot tool
#        slurp               # Region selector for screenshots
#        swww                # Wallpaper manager for Wayland
#        hyprpaper		# Wallpaper manager for Wayland
#        mako
        firefox
        networkmanagerapplet

        # Programming utilities
        kitty
        gcc
        flutter
        nodejs
        vim
        neovim
#        zed-editor
        sass
	virtualbox
	foot

        # System configuration tools
        zip
        unzip
        lolcat

        # Zsh and plugins
        zsh
        autojump
        zsh-syntax-highlighting
        zsh-autosuggestions

	# Attack tools
	  # Man in the middle attacks
	    ettercap
	    bettercap

	# Olicyber
	  # Misc
	    curl
	    php
	    python312
	    python312Packages.requests
	    python312Packages.pip
	    python312Packages.pyngrok
	    python312Packages.binwalk		# Stenography
	    python312Packages.pyshark		# Network
            python312Packages.ropper		# Software
	    python312Packages.pycryptodome	# Crypto
	    python312Packages.pwntools
	    python312Packages.beautifulsoup4
	    python312Packages.selenium
	    python312Packages.gmpy2
	    git
	    jdk23
	    ngrok
	    docker
	  
	  # Stenography
	    binwalk
	    gimp
	    stegsolve
	    john		# john-the-ripper
	    johnny		# GUI for john-the-ripper

	  # Network
	    wireshark
	    tshark
	    
	  # Web
	    burpsuite
	    postman
	    selenium-manager

	  # Software
	    ht
	    ltrace
	    gdb
	    pwndbg
	    pwntools
	    patchelfUnstable
	    elfutils
	    ruby_3_4
	    rubyPackages_3_4.seccomp-tools
	    rubyPackages_3_4.one_gadget
	    one_gadget
	    ghidra
	    ida-free
	    hexcurse

	    
	  # Crypto
	    micromamba
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
