{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixd
  ];

  programs.nixvim = {
    plugins.cmp-nvim-lsp.enable = true;

    plugins.lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        nixd.enable = true;
      };
    };
  };
}
