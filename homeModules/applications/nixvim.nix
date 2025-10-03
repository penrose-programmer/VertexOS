{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixd
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;

    colorschemes.ayu.enable = true;

    # LSP
    lsp.servers = {
      nixd.enable = true;
    };

    # CMP
    plugins.cmp = {
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };

    # Extra plugins
    extraPlugins = with pkgs.vimPlugins; [
      nvim-treesitter
      neo-tree-nvim
      nvim-web-devicons
    ];

    globalOpts = {
      expandtab = true;
      shiftwidth = 2;
    };

    clipboard.register = "unnamedplus";
  };
}
