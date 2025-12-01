{ pkgs, ... }: {
  imports = [
    ./applications.nix
    ./bash.nix
    ./docker.nix
    ./kitty.nix
    ./languages.nix
    ./rofi.nix
    ./tmux.nix
  ];
}
