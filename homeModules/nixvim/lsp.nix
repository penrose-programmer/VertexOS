{ pkgs, ... }: {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        nixd.enable = true;
        gdscript = {
          enable = true;
          package = null;
        };
      };
    };
  };
}
