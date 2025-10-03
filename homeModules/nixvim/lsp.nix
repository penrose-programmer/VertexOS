{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixd
  ];

  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        nixd.enable = true;
      };
    };
  };
}
