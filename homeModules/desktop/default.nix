{ pkgs, ... }: {
  imports = [
    ./dunst.nix
    ./stylix.nix
    ./waybar.nix
  ];
}
