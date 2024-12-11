{
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
}
