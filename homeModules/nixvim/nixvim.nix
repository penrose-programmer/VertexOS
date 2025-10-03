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
      key = "<leader>q";
      action = "<cmd>echo 'hi'<cr>";
      options = {
        silent = true;
        desc = "Leader Test";
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = ":Telescope find_files";
      options = {
        silent = true;
        desc = "Find Files";
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = ":Telescope live_grep";
      options = {
        silent = true;
        desc = "Grep Files";
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = ":Telescope buffers";
      options = {
        silent = true;
        desc = "Find Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = ":Telescope help_tags";
      options = {
        silent = true;
        desc = "Find Help";
      };
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = ":Telescope diagnostics";
      options = {
        silent = true;
        desc = "Find Diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>ft";
      action = ":Telescope treesitter";
      options = {
        silent = true;
        desc = "Find Treesitter";
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
