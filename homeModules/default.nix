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
    ./applications/rp.nix

    ./git/git.nix
    ./git/gh.nix

    ./wm/hyprland.nix
    ./wm/hypridle.nix
    ./wm/hyprpaper.nix

    ./nixvim/default.nix
  ];
}
