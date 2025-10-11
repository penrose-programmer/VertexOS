{ pkgs, ... }: {
  imports = [
    ./applications/default.nix
    ./git/default.nix
    ./desktop/default.nix
    ./nixvim/default.nix
  ];
}
