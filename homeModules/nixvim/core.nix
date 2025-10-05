{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;
    
    globals.mapLeader = " ";

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

    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };
    
    globalOpts = {
      expandtab = true;
      shiftwidth = 2;
    };

    clipboard.register = "unnamedplus";
  };
}
