{ pkgs, ... }: {
  imports = [
    ./applications/applications.nix
    ./applications/neofetch.nix
    ./applications/tmux.nix
    ./applications/kitty.nix
    ./applications/bash.nix
    ./applications/firefox.nix
    ./applications/pnpm.nix
    ./applications/portablemc.nix

    ./git/git.nix
    ./git/gh.nix

    ./hypr/hyprland.nix
    ./hypr/hypridle.nix

    ./nixvim/nixvim.nix
  ];
}
