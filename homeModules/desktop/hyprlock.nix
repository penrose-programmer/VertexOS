{ config, pkgs, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "~/Pictures/Wallpaper.jpg";
        }
      ];

      input-field = [
        {
          size = "500, 50";
          position = "0, -500";
          font_color = "#${config.stylix.base16Scheme.base0A}";
          inner_color = "#${config.stylix.base16Scheme.base00}";
          outer_color = "#${config.stylix.base16Scheme.base02}";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          placeholder_text = "Password...";
        }
      ];
    };
  };
}
