{ config, pkgs, ... }:
{
  # Informazioni sull'utente e sulla directory da gestire
  home = {
    username = "frank";
    homeDirectory = "/home/frank";
  };

  # Versione di Home Manager compatibile con questa configurazione
  home.stateVersion = "24.05"; # Non cambiare senza controllare le note di rilascio

  # Pacchetti da installare nell'ambiente utente
  home.packages = [
    # Esempio di aggiunta del comando 'hello'
    pkgs.hello

    # Esempio di script shell personalizzato
    (pkgs.writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')
  ];

  # Gestione dei file di configurazione (dotfiles)
  home.file = {
  };

  # Variabili di ambiente
  home.sessionVariables = {
    EDITOR = "neovim";
    BROWSER = "google-chrome";
    TERMINAL = "kitty";
  };

  # Configurazione dei programmi
  programs = {
    git = {
      enable = true;
      userName = "FrankStrix";
      userEmail = "matteo.francavilla@outlook.com";
      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
      extraConfig = {
        color.ui = "auto";
        push.default = "simple";
        pull.rebase = true;
        branch.autosetuprebase = "always";
        init.defaultBranch = "main";
      };
    };

   # hyprland = {
   #   enable = true;
   # };

    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };

    kitty = {
      enable = true;
    };
  };

  # Permette a Home Manager di installare e gestire sé stesso
  programs.home-manager.enable = true;
}
