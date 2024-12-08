{ inputs, config, pkgs, ... }:
{
  ##################################################
  # SYSTEM CONFIGURATION
  ##################################################

  # Imports
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking
  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
    extraHosts = ''
      10.129.199.47 unika.htb
    '';
  };

  # Localization
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

  # Security
  security.rtkit.enable = true;

  ##################################################
  # DISPLAY AND AUDIO
  ##################################################

  services = {
    xserver = {
      enable = true;
      xkb.layout = "it";
    };
    libinput.enable = true;
    printing.enable = true;

    # Pipewire configuration
    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

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

  console.keyMap = "it2";

  ##################################################
  # PACKAGES
  ##################################################

  # User configuration
  users.users.frank = {
    isNormalUser = true;
    description = "Frank";
    extraGroups = [ "networkmanager" "wheel" ];
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

  # System-wide packages
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
    #hyprland            # Hyprland window manager
    #rofi                # Application launcher
    #waybar              # Status bar
    #dunst               # Notification daemon
    #kitty               # Terminal emulator
    #xdg-desktop-portal  # Portal for Wayland apps
    #xdg-desktop-portal-gtk
    #wl-clipboard        # Clipboard manager for Wayland
    #grim                # Screenshot tool
    #slurp               # Region selector for screenshots
    #swww                # Wallpaper manager for Wayland

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

  # Environment variables
#  environment.sessionVariables = {
#    XDG_SESSION_TYPE = "wayland";
#    XDG_CURRENT_DESKTOP = "Hyprland";
#    WLR_NO_HARDWARE_CURSORS = "1";
#    QT_QPA_PLATFORM = "wayland";
#    MOZ_ENABLE_WAYLAND = "1";
#    NIXOS_OZONE_WL = "1";
#  };

  ##################################################
  # HYPRLAND CONFIGURATION
  ##################################################

#  programs.hyprland = {
#    enable = true;
#    xwayland.enable = true;
#  };

  # Aliases for shell
  programs.bash.shellAliases = {
    l = "ls -alh";
    ll = "ls -l";
    ls = "ls --color=tty";
    rico = "sudo nixos-rebuild switch --flake /etc/nixos/#frank";	# Rebuild NixOS
    modc = "sudo nano /etc/nixos/modules/nixos/configuration.nix";	# Modify configuration.nix
    modf = "sudo nano /etc/nixos/flake.nix";				# Modify flake.nix
    modh = "sudo nano /etc/nixos/modules/home-manager/home.nix";	# Modify home.nix
    upda = "sudo nix-channel --update nixos; rico";			# Upgrade nix-channel
    grbg = "sudo nix-collect-garbage -d";				# Garbage coollector
    hypr = "hyprctl reload"; 						# Reaload hypr config
  };

  ##################################################
  # ADDITIONAL SERVICES
  ##################################################

  # Enable Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      frank = import ../home-manager/home.nix;
    };
  };

  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };

  ##################################################
  # SYSTEM STATE AND UPDATES
  ##################################################

  # State version
  system.stateVersion = "24.05";

  # Auto upgrades
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = "https://nixos.org/channels/nixos-24.11";
  };

  ##################################################
  # NIX SETTINGS
  ##################################################

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };
}
