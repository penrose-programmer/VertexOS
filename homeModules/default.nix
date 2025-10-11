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
    ./applications/mpg.nix
    ./applications/lazygit.nix
    ./applications/godot.nix

    ./git/git.nix
    ./git/gh.nix

    ./desktop/hyprland.nix
    ./desktop/hypridle.nix
    ./desktop/hyprpaper.nix
    ./desktop/hyprlock.nix
    ./desktop/waybar.nix

    ./nixvim/default.nix
  ];
}
