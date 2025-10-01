{ pkgs, ... }: {
  programs.kitty = {
    enable = true;

    font.name = "Jetbrains Mono Nerd Font";
    font.size = 10;

    settings = {
      background = "#161616";
      foreground = "#f2f4f8";
      color0  = "#262626";
      color1  = "#ff7eb6";
      color2  = "#42be65";
      color3  = "#ffe97b";
      color4  = "#78a9ff";
      color5  = "#be95ff";
      color6  = "#33b1ff";
      color7  = "#dfdfe0";
      color8  = "#393939";
      color9  = "#ff7eb6";
      color10 = "#42be65";
      color11 = "#ffe97b";
      color12 = "#78a9ff";
      color13 = "#be95ff";
      color14 = "#33b1ff";
      color15 = "#ffffff";
    };
  };
}
