{ pkgs, ... }: {
  imports = [
    ./applications.nix
    ./bash.nix
    ./kitty.nix
    ./languages.nix
    ./rofi.nix
    ./tmux.nix
  ];
}
