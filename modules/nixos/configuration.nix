{ inputs, config, pkgs, ... }:
{
  # Imports
  imports = [
    ./hardware-configuration.nix
    ./modules/default.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  console.keyMap = "it2";

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
