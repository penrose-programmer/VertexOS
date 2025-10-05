{ pkgs, ... }: {
    programs.nixvim = {
      extraPlugins = with pkgs.vimPlugins; [
        nvim-treesitter
        neo-tree-nvim
        nvim-web-devicons
        vim-tmux-navigator
        telescope-fzf-native-nvim
        nvim-cmp
      ];

      plugins.web-devicons.enable = true;
      colorschemes.ayu.enable = true;
      plugins.bufferline.enable = true;
    };
}
