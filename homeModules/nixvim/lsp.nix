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
          cmd = [ "vim.lsp.rpc.connect" "127.0.0.1" "6005" ];
          root_dir = ''require("lspconfig.util").root_pattern("project.godot", ".git")'';
        };
      };
    };
  };
}
