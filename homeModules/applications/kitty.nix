{ pkgs, ... }: {
  programs.kitty = {
    enable = true;

    font.name = "Jetbrains Mono Nerd Font";
    font.size = 10;

    extraConfig = ''
      # The Background/Foreground
      background #0b0e14
      foreground #bfbdb6

      # The Cursor Colours
      cursor #bfbdb6
      selection_background #2d3a4a
      selection_foreground #bfbdb6

      # Black
      color0  #0b0e14

      # Red
      color1  #f07178

      # Green
      color2  #b8cc52

      # Yellow
      color3  #ffb454

      # Blue
      color4  #59c2ff

      # Magenta
      color5  #d2a6ff

      # Cyan
      color6  #95e6cb

      # White
      color7  #bfbdb6

      # Bright Variants
      color8  #565a6e
      color9  #f07178
      color10 #b8cc52
      color11 #ffb454
      color12 #59c2ff
      color13 #d2a6ff
      color14 #95e6cb
      color15 #ffffff
    '';
  };
}
