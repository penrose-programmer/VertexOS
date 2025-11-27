{ pkgs, ... }: {
  programs.kitty = {
    enable = true;

    extraConfig = '':
        window_margin_width 5
    '';
  };
}
