{ pkgs, ... }: {
  imports = [
    ./desktop/hypridle.nix
    ./desktop/pavucontrol.nix
    ./desktop/tlp.nix
    ./desktop/screenshot.nix
    ./desktop/clipboard.nix
  ];
}
