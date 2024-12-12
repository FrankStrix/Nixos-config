{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprmag.url = "github:SIMULATAN/hyprmag";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.frank = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./modules/nixos/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
