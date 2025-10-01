{ pkgs, ... }: {
  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      { 
        plugin = vim-tmux-navigator;
      }

      { 
        plugin = tmux-nova;

        extraConfig = ''
          set -g @nova-segment-mode-colors "#78a2c1 #2e3440"
        '';
      }
    ];

    
    extraConfig = ''
      # Set the prefix to Ctrl+a
      set -g prefix C-a

      # Remove the old prefix
      unbind C-b

      # Send Ctrl+a to applications by pressing it twice
      bind C-a send-prefix

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
  };
}
