{ pkgs, ... }: {
  programs.kitty = {
    enable = true;

    extraConfig = '':
        font_size 10
        font_family JetBrainsMono Nerd Font Mono
        window_margin_width 5
    '';
  };
}
