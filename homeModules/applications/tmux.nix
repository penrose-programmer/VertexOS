{ pkgs, ... }: {
  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      tmux-nova
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
      
      # Set segment colours to oxocarbon
      set -g @nova-segment-mode-colors "#be95ff #262626"
    '';
  };
}
