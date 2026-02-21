{ pkgs, ... }: {
  imports = [
    ./applications.nix
    ./bash.nix
    ./icons.nix
    ./kitty.nix
    ./fcitx5.nix
  ];
}
