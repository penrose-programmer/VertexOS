{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      pkgs.hyprlandPlugins.hyprscrolling
    ];

    settings = {
      "$mod" = "SUPER";
      "$mod_s" = "SUPER_SHIFT";
      "$mod_c" = "SUPER_CTRL";
      
      plugin = {
        hyprscrolling = {
          fullscreen_on_one_column = true;
          focus_fit_method = 0;
          column_width = 0.48;
        };
      };

      misc = {
        disable_hyprland_logo = true;
      };

      decoration = {
        rounding = 0;
        active_opacity = 0.85;
        inactive_opacity = 0.75;
      };

      general = {
        layout = "scrolling";
        gaps_in = 0;
        gaps_out = 10;
      };

      animations = {
        enabled = true;
        bezier = [
          "slick, 0.0, 0.1, 0.9 , 1.0"
        ];
        animation = [
          "windows, 1, 2, slick, slide"
          "fade, 1, 2, slick"
        ];
      };

      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
        "$mod, Q, killactive"
        "$mod, F, fullscreen, 1"
        "$mod, T, togglefloating"
        "$mod_s, H, movewindow, l"
        "$mod_s, J, movewindow, d"
        "$mod_s, K, movewindow, u"
        "$mod_s, L, movewindow, r"
        ''
        $mod_s, S, exec, grim -g "$(slurp -d)" - | wl-copy
        ''
        "$mod_c, H, resizeactive, -10 0"
        "$mod_c, J, resizeactive, 0 10"
        "$mod_c, K, resizeactive, 0 -10"
        "$mod_c, L, resizeactive, 10 0"
        "$mod, DELETE, exec, hyprlock"
        "$mod_s, DELETE, exec, kitty hyprctl dispatch exit"
        "ALT, SPACE, exec, rofi -show drun"
        "$mod, Z, exec, firefox"
        "$mod, X, exec, kitty nvim"
        "$mod, C, exec, thunar"
      ];

      bindm = [
        "$mod, mouse:273, resizewindow"
        "$mod, mouse:272, movewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      exec-once = [
        "hypridle"
        "blueman-applet"
        "nm-applet"
        "mpg123 ~/Music/SFX/welcome_aboard.mp3"
        "sleep 1 && waybar"
        "ollama start"
      ];

      input.touchpad = {
        natural_scroll = true;
        disable_while_typing = false;
        scroll_factor = 0.5;
      };

      input = {
        kb_layout = "us, us";
        kb_variant = ", dvorak";
        kb_options = "grp:win_space_toggle";
      };
    };
  };
}
