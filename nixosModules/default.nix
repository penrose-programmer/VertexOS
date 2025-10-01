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
    ./applications/nm-applet.nix
    ./applications/htop.nix
    ./applications/kitty.nix

    ./hypr/hypr.nix

    ./services/services.nix
    ./services/kanata.nix
  ];
}
