{ inputs, config, pkgs, ... }:
{

################################################## OPERATING SYSTEM BASICS ##################################################
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;       # Whether to enable the systemd-boot (formerly gummiboot) EFI boot manager.
      efi.canTouchEfiVariables = true;  # Whether the installation process is allowed to modify EFI boot variables.
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Enable networking
  networking = {
    networkmanager.enable = true; # Whether to use NetworkManager to obtain an IP address and other configuration for all network interfaces that are not manually configured
    hostName = "nixos";           # Define your hostname.
    # wireless.enable = true;     # Enables wireless support via wpa_supplicant.
    extraHosts = ''10.129.199.47 unika.htb '';
  };

  # Set your time zone.
  time.timeZone = "Europe/Rome";
  i18n.extraLocaleSettings = {
    defaultLocale = "en_US.UTF-8";
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  services = {
    xserver = {
      enable = true;                         # Whether to enable the X server.
      xkb.layout = "it";                     # X keyboard layout
    };

    libinput.enable = true;  # Whether to enable libinput.
    printing.enable = true;  # Whether to enable printing support through the CUPS daemon.
    desktopManager.plasma6.enable = true;  # Enable the Plasma 6 (KDE 6) desktop environment.

    displayManager = {
      sddm.enable = true;     # Whether to enable sddm as the display manager.
      autoLogin = {
        enable = false;       # Automatically log in as autoLogin.user
        user = "frank";       # User to be used for the automatic login.
      };
    };
    onedrive.enable = true;
    pipewire = {
      enable = true;             # Whether to enable PipeWire service.
      pulse.enable = true;       # Whether to enable PulseAudio server emulation.
      jack.enable = true;        # Whether to enable JACK audio emulation.
      alsa = {
        enable = true;           # Whether to enable ALSA support.
        support32Bit = true;     # Whether to enable 32-bit ALSA support on 64-bit systems.
      };
    };
  };

  console.keyMap = "it2"; # Configure console keymap
  security.rtkit.enable = true;


################################################## PACKAGES ##################################################

  # Define a user account.
  users.users.frank = {
    isNormalUser = true;
    description = "frank";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #ides
      vscode-fhs
      jetbrains.idea-ultimate

      #apps
      vesktop
      spotify
      libreoffice

      #school shii
      ciscoPacketTracer8
      wireshark
      burpsuite
      ghidra
      binwalk
    ];
  };

  #The set of packages that appear in /run/current-system/sw.
  #These packages are automatically available to all users,
  #and are automatically updated every time you rebuild the system configuration
  environment = {
    systemPackages = with pkgs; [
      # Nix packages
      home-manager

      # Utilities
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

      # Ctf utils
      sherlock
      nmap
      putty
      mysql84
      gobuster
      pwntools

      # Hyprland
      hyprland
      rofi
      xdg-desktop-portal-gtk
      dunst
      waybar
      swww

      # Programming utilities
      gdb
      kitty

      # Programming stuff
      python3Full
      gcc
      jdk23
      flutter
      nodejs
      vim
      neovim
      zed-editor
      sass
      
      # System conf pkgs
      zip
      unzip
      lolcat

      # Zsh
      zsh
      autojump
      zsh-syntax-highlighting
      zsh-autosuggestions
    ];
    sessionVariables = {
      # If cursor becomes invisible
      #WLR_NO_HARDWARE_CURSORS = "1";
      # Hint electron apps to use wayland
      NIXOS_OZONE_WL = "1";
    };
  };


################################################## ADDITIONAL SERVICES ##################################################

  programs = {
    firefox.enable = true;  # Whether to enable the Firefox web browser.
    nix-ld = {
      enable = true;        # Whether to enable nix-ld
      libraries = with pkgs; [
        xorg.libX11
        libGL
      ];
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    bash.shellAliases = {
      l = "ls -alh";
      ll = "ls -l";
      ls = "ls --color=tty";
      rico = "sudo nixos-rebuild switch --flake /etc/nixos/#frank";
      modc = "sudo nano /etc/nixos/modules/nixos/configuration.nix";
      modf = "sudo nano /etc/nixos/flake.nix";
      modh = "sudo nano /etc/nixos/modules/home-manager/home.nix";
      upda = "sudo nix-channel --update nixos; rico";
      grbg = "sudo nix-collect-garbage -d";
    };
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      frank = import ../home-manager/home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #######
  # Nix #
  #######
  nix = {
    settings = {
      # Enable nix flakes
      experimental-features = ["nix-command" "flakes"];
      # Optimize store automatically
      auto-optimise-store = true;
    };
  };

  # Enable automatic upgrades
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = "https://nixos.org/channels/nixos-24.11";
  };

  # Enable bluetooth
  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  # Enable firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };

  # Fonts
  fonts.packages = with pkgs; [
    fira-code                     # Most Stuff (kitty, GTK, etc.)
    font-awesome                  # Something on the System
    nerdfonts                     # Gotta Get Em All
    powerline-fonts               # Neovim etc.        
  ];



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
