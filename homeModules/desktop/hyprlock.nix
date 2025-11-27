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
          path = "~/Pictures/samurai.jpg";
          blur_passes = "2";
        }
      ];

      input-field = [
        {
          size = "500, 50";
          position = "0, -150";
          font_family = "jetbrains-mono";
          font_color = config.stylix.base16Scheme.base0E;
          inner_color = config.stylix.base16Scheme.base00;
          outer_color = config.stylix.base16Scheme.base01;
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          placeholder_text = "Password...";
          rounding = "0";
        }
      ];

      label = [
        {
          text = "$TIME";
          color = config.stylix.base16Scheme.base0D;
          font_family = "jetbrains-mono";
          position = "0, 50";
          font_size = "100";
          monitor = "";
        }
        {
          text = "Welcome, $USER!";
          color = config.stylix.base16Scheme.base05;
          font_family = "jetbrains-mono";
          position = "0, -50";
          font_size = "25";
          monitor = "";
        }
      ];
    };
  };
}
