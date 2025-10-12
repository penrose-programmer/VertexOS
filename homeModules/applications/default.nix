{ pkgs, ... }: {
  imports = [
    ./applications.nix
    ./bash.nix
    ./kitty.nix
    ./rofi.nix
    ./tmux.nix
  ];
}
