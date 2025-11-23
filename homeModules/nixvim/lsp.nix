{ pkgs, ... }: {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        nixd.enable = true;
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        gdscript = {
          enable = true;
          package = null;
          cmd = [ "godot4" "--headless" "--editor" "--lsp" ];
        };
      };
    };
  };
}
