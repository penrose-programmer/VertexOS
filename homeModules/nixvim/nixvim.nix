{ pkgs, ... }: {

  imports = [
    ./lsp.nix
    ./gcc.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;
    
    globals.mapLeader = ",";

    extraPlugins = with pkgs.vimPlugins; [
      nvim-treesitter
      neo-tree-nvim
      nvim-web-devicons
      vim-tmux-navigator
      telescope-fzf-native-nvim
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

    keymaps = [
      {
        mode = "n";
        key = "<leader>m";
        action = "<cmd>Neotree toggle<CR>";
        options = {
          desc = "Leader Test";
        };
      }
    ];
    
    plugins.cmp-nvim-lsp.enable = true;

    plugins.web-devicons.enable = true;

    globalOpts = {
      expandtab = true;
      shiftwidth = 2;
    };

    clipboard.register = "unnamedplus";
  };
}
