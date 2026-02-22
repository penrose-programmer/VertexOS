{ pkgs, ... }: {
  imports = [
    ./applications.nix
    ./bash.nix
    ./icons.nix
    ./kitty.nix
    ./ibus.nix
  ];
}
