{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$mod_s" = "SUPER_SHIFT";
      "$mod_c" = "SUPER_CTRL";

      misc = {
        disable_hyprland_logo = true;
      };

      decoration = {
        rounding = 5;
        active_opacity = 0.85;
        inactive_opacity = 0.75;
      };

      general = {
        gaps_out = 10;
      };

      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
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
        "ALT, SPACE, exec, rofi -show drun -theme Arc-Dark"
        "$mod, Z, exec, firefox"
        "$mod, X, exec, vscode"
        "$mod, C, exec, thunar"
      ] ++ (
        # workspaces
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, focusworkspaceoncurrentmonitor, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
            ]
          )
        9)
      );

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
        "waybar"
        "blueman-applet"
        "nm-applet"
        "neofetch"
        "quickshell"
        "mpg123 ~/Music/SFX/welcome_aboard.mp3"
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
