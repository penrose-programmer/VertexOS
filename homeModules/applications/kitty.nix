{ pkgs, ... }: {
  programs.kitty = {
    enable = true;

    font.name = "Jetbrains Mono Nerd Font";
    font.size = 10;

    extraConfig = ''
background #0F1419
    foreground #E6E1CF

    cursor #E6E1CF
    selection_background #272D38
    selection_foreground #E6E1CF

    # Normal colors
    color0  #0F1419
    color1  #F07178
    color2  #B8CC52
    color3  #FFB454
    color4  #59C2FF
    color5  #D2A6FF
    color6  #95E6CB
    color7  #E6E1CF

    # Bright colors
    color8  #3E4B59
    color9  #F07178
    color10 #B8CC52
    color11 #FFB454
    color12 #59C2FF
    color13 #D2A6FF
    color14 #95E6CB
    color15 #F3F4F5
    '';
  };
}
