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
      blur_passes = "4";
    }
  ];

  input-field = [
    {
      size = "500, 50";
      position = "0, -150";
      font_family = "jetbrains-mono";
      font_color   = "rgba(187, 154, 247, 1.0)";  # was #BB9AF7
      inner_color  = "rgba(22, 22, 30, 1.0)";     # was #16161E
      outer_color  = "rgba(26, 27, 38, 1.0)";     # was #1A1B26
      monitor      = "";
      dots_center  = true;
      fade_on_empty= false;
      placeholder_text = "Password...";
      rounding = "0";
    }
  ];

  label = [
    {
      text = "$TIME";
      color = "rgba(122, 162, 247, 1.0)";         # was #7AA2F7
      font_family = "jetbrains-mono";
      position = "0, 50";
      font_size = "100";
      monitor = "";
    }
    {
      text = "Welcome, $USER!";
      color = "rgba(187, 154, 247, 1.0)";         # was #BB9AF7
      font_family = "jetbrains-mono";
      position = "0, -50";
      font_size = "25";
      monitor = "";
    }
  ];
};

};
}
