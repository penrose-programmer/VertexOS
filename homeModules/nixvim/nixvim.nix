{ pkgs, ... }: {

  imports = [
    ./lsp.nix
    ./gcc.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;
    
    globals.mapLeader = " ";

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
      key = "<leader>f";
      action = "???";
      #    lua = true;
      options = {
        silent = true;
        desc = "  Find";
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua require('telescope.builtin').find_files()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Find Files";
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>lua require('telescope.builtin').live_grep()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Grep Files";
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>lua require('telescope.builtin').buffers()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Find Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>lua require('telescope.builtin').help_tags()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Find Help";
      };
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = "<cmd>lua require('telescope.builtin').diagnostics()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Find Diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>ft";
      action = "<cmd>lua require('telescope.builtin').treesitter()<CR>";
      #    lua = true;
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
