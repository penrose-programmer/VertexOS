{ pkgs, ... }: {
  imports = [
    ./desktop/pavucontrol.nix
    ./desktop/tlp.nix
    ./desktop/screenshot.nix
    ./desktop/clipboard.nix
    ./desktop/dunst.nix
    ./desktop/stylix.nix
    ./desktop/fonts.nix

    ./applications/docker.nix
    ./applications/thunar.nix
    ./applications/firefox.nix
    ./applications/nm-applet.nix
    ./applications/htop.nix
    ./applications/kitty.nix

    ./hypr/hypr.nix

    ./services/services.nix
    ./services/kanata.nix
  ];
}
