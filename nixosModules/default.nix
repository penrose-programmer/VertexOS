{ pkgs, ... }: {
  imports = [
    ./desktop/pavucontrol.nix
    ./desktop/tlp.nix
    ./desktop/screenshot.nix
    ./desktop/clipboard.nix
    ./desktop/stylix.nix

    ./applications/thunar.nix
    ./applications/firefox.nix
    ./applications/rofi.nix

    ./hypr/hypridle.nix
    ./hypr/hyprland.nix
    ./hypr/hyprlock.nix

    ./services/services.nix
  ];
}
