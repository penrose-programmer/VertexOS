{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;
    
    extraConfigLuaPre = ''
      vim.g.mapleader = " "
    '';

    globalOpts = {
      expandtab = true;
      shiftwidth = 2;
    };

    clipboard.register = "unnamedplus";
  };
}
