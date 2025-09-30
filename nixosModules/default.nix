{ pkgs, ... }: {
  imports = [
    ./desktop/hypridle.nix
    ./desktop/pavucontrol.nix
    ./desktop/tlp.nix
  ];
}
