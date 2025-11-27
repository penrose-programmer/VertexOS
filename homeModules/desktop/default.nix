{ pkgs, ... }: {
  imports = [
    ./dunst.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./stylix.nix
    ./waybar.nix
  ];
}
