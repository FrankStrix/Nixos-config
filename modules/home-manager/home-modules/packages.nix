{ pkgs, ... }: {
  home.packages = with pkgs; [
    vscodium
    git
    kitty
    neovim
    zsh
    autojump
    zsh-syntax-highlighting
    zsh-autosuggestions
  ];
}
