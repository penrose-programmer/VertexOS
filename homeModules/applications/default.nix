{ pkgs, ... }: {
  imports = [
    ./applications.nix
    ./bash.nix
    ./kitty.nix
    ./tmux.nix
  ];
}
