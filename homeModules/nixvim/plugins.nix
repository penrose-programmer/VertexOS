{ pkgs, config, ... }: {
  programs.nixvim = {
    plugins.neo-tree.enable = true;
    plugins.lazygit.enable = true;
    plugins.cmp-nvim-lsp.enable = true;
    plugins.web-devicons.enable = true;
    plugins.tmux-navigator.enable = true;
    plugins.godot.enable = true;

    colorschemes.catppuccin.enable = true;
  };
}
