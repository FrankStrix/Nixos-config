{
  # Aliases for shell
  programs.bash.shellAliases = {
    l = "ls -hal";
    ll = "ls -l";
    ls = "ls --color=tty";
    rico = "sudo nixos-rebuild switch --flake /etc/nixos/#frank";	# Rebuild NixOS
    modc = "sudo nano /etc/nixos/modules/nixos/configuration.nix";	# Modify configuration.nix
    modf = "sudo nano /etc/nixos/flake.nix";				# Modify flake.nix
    modh = "sudo nano /etc/nixos/modules/home-manager/home.nix";	# Modify home.nix
    modp = "sudo nano /etc/nixos/modules/nixos/modules/packages.nix";	# Modify the installed packages on the machine
    mods = "sudo nano /etc/nixos/shell.nix";				# Modify the custom shell
    upda = "sudo nix-channel --update nixos; rico";			# Upgrade nix-channel
    grbg = "sudo nix-collect-garbage -d";				# Garbage coollector
    jour = "journalctl -xe --unit home-manager-frank";			# See any files that collide with home-manager
    hypr = "hyprctl reload"; 						# Reaload hypr config
    shel = "nix-shell /etc/nixos/shell.nix";				# Open the custom shell
    ones = "systemctl --user enable onedrive@onedrive.service";		# See the status of the onedrive client service
  };
}
