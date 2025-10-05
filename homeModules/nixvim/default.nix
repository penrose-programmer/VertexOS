{ pkgs, ... }: {

  imports = [
    ./core.nix
    ./lsp.nix
    ./gcc.nix
    ./plugins.nix
    ./keymaps.nix
  ];
}
