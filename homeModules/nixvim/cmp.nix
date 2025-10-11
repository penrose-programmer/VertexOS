{ pkgs, ... }: {
  plugins.cmp = {
    enable = true;
    settings = {
      completion = {
        completeopt = "menu,menuone,noinsert";
      };

      autoEnableSources = true;

      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];

      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<Tab>" = "cmp.mapping.confirm({ select = true })";
      };
    };
  };
}
