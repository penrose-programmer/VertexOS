{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixd
  ];

  programs.nixvim = { 
    enable = true; 
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;

    colorschemes.ayu.enable = true;

    lsp.servers = {
      nixd.enable = true;
    };

    plugins.cmp = {
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };

    plugins.cmp-nvim-lsp.enable = true;

    plugins.conform-nvim.enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      nvim-treesitter
      neo-tree-nvim
      nvim-web-devicons
      vim-tmux-navigator
    ];

    globalOpts = {
      expandtab = true;
      # tabstop = 4;
      shiftwidth = 2;
      # softtabstop = 0;
      # smarttab = true;
    };

    clipboard.register = "unnamedplus";
  };
}
