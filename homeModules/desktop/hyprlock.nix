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
          path = "~/Pictures/Wallpaper.png";
          blur_passes = "2";
        }
      ];

      input-field = [
        {
          size = "500, 50";
          position = "0, -150";
          font_family = "jetbrains-mono";
          font_color = "rgba(255, 180, 84, 1.0)";
          inner_color = "rgba(15, 20, 25, 1.0)";
          outer_color = "rgba(39, 45, 56, 1.0)";
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
          color = "rgba(255, 180, 84, 1.0)";
          font_family = "jetbrains-mono";
          position = "0, 50";
          font_size = "100";
          monitor = "";
        }
        {
          text = "Welcome, $USER!";
          color = "rgba(255, 255, 255, 0.5)";
          font_family = "jetbrains-mono";
          position = "0, -50";
          font_size = "25";
          monitor = "";
        }
      ];

    };
  };
}
