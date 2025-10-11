{ pkgs, ... }: {
  imports = [
    ./core.nix
    ./cmp.nix
    ./telescope.nix
    ./lsp.nix
    ./plugins.nix
    ./keymaps.nix
  ];
}
