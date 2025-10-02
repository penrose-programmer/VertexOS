{ pkgs, ... }: {
  imports = [
    ./applications/applications.nix
    ./applications/nixvim.nix
    ./applications/neofetch.nix
    ./applications/tmux.nix
    ./applications/kitty.nix
    ./applications/bash.nix
    ./applications/firefox.nix
    ./applications/pnpm.nix
    ./applications/mcpelauncher.nix

    ./git/git.nix
    ./git/gh.nix

    ./hypr/hyprland.nix
    ./hypr/hypridle.nix
  ];
}
