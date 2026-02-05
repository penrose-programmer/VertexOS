{ pkgs, ... }: {
  imports = [
    ./applications/default.nix
    ./git/default.nix
    ./hyprland/hyprland.nix
  ];
}
