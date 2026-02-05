{ pkgs, ... }: {
  imports = [
    ./desktop/pavucontrol.nix
    ./desktop/tlp.nix
    ./desktop/screenshot.nix
    ./desktop/clipboard.nix
    ./desktop/dunst.nix
    ./desktop/fonts.nix

    ./applications/thunar.nix
    ./applications/firefox.nix
    ./applications/nm-applet.nix
    ./applications/htop.nix
    ./applications/kitty.nix

    ./services/services.nix
    ./services/kanata.nix
  ];
}
