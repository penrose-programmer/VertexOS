{ pkgs, ... }: {
  imports = [
    ./applications/applications.nix
    ./applications/nixvim.nix
    ./applications/neofetch.nix
    ./applications/tmux.nix
    ./applications/kitty.nix
    ./applications/bash.nix
  ];
}
