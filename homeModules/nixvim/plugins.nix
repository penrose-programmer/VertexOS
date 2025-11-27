{ pkgs, ... }: {
    programs.nixvim = {
      extraPlugins = with pkgs.vimPlugins; [
        nvim-treesitter
        neo-tree-nvim
        nvim-web-devicons
        vim-tmux-navigator
        telescope-fzf-native-nvim
        nvim-cmp
        lazygit-nvim
        vim-be-good
        vim-godot
      ];

      plugins.cmp-nvim-lsp.enable = true;
      plugins.web-devicons.enable = true;
    };
}
