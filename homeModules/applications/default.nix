{ pkgs, ... }: {
  imports = [
    ./applications.nix
    ./gimp.nix
    ./bash.nix
    ./kitty.nix
    ./languages.nix
    ./rofi.nix
    ./tmux.nix
  ];
}
