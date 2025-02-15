{
    networking = {
        networkmanager.enable = true;
        hostName = "nixos";
        extraHosts = ''
        10.129.199.47 unika.htb
        '';
  };
}
