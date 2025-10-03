{ pkgs, ... }: {

  imports = [
    ./lsp.nix
    ./gcc.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;

    extraPlugins = with pkgs.vimPlugins; [
      nvim-treesitter
      neo-tree-nvim
      nvim-web-devicons
      vim-tmux-navigator
      telescope-nvim
      nvim-cmp
    ];

    colorschemes.ayu.enable = true;

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
          "<Tab>"      = "cmp.mapping.confirm({ select = true })";
        };
      };
    };
    
    plugins.cmp-nvim-lsp.enable = true;

    plugins.telescope.enable = true;

    plugins.web-devicons.enable = true;

    globalOpts = {
      expandtab = true;
      shiftwidth = 2;
    };

    clipboard.register = "unnamedplus";
  };
}
