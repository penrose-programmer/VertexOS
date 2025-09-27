{ config, pkgs, inputs, ... }:

{
  home.username = "penrose";
  home.homeDirectory = "/home/penrose";

  xresources.properties = {
    "Xft.dpi" = 172;
  };

  home.sessionVariables = {
    EDITOR = "vscode";
  };

  home.packages = with pkgs; [

    # Applications
    p3x-onenote
    protonvpn-gui
    obs-studio
    obsidian
    logseq
    godot

    # Terminal
    neofetch
    ripgrep
    nnn
    gh

    # AI
    gemini-cli
  ];

  stylix.enable = true;
  stylix.targets.waybar.enable = false;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake .#nixos";
      testUpdate = "sudo nixos-rebuild test --flake .#nixos";
      hmUpdate = "home-manager switch --flake ~/.config/home-manager";
    };
  };

  programs.git = {
    enable = true;
    userName = "penrose-programmer";
    userEmail = "syedtalhahahmed@gmail.com";

    extraConfig = {
      credential.helper = "cache --timeout=3600";
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "https";
  };

  programs.firefox = {
    enable = true;
  };

  programs.quickshell = {
    enable = true;

  }

  services.hypridle = {
    enable = true;
    settings = {
      general = {
          lock_cmd = "pidof hyprlock || hyprlock";       # avoid starting multiple hyprlock instances.
          before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
          after_sleep_cmd = "hyprctl dispatch dpms on";  # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = 60;
          on-timeout = "brightnessctl -s set 10%";         # lower brightness when timout has passed
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 900;
          on-timeout = "loginctl lock-session";            # lock screen when timeout has passed
        }

        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";        # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on";          # screen on when activity is detected after timeout has fired.
        }

        {
          timeout = 1800;
          on-timeout = "systemctl suspend";                # suspend pc
        }
      ];
    };
  };

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
        rounding = 8;
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
      ];

      input.touchpad = {
        natural_scroll = true;
        scroll_factor = 0.5;
      };

      input = {
        kb_layout = "us, us";
        kb_variant = ", dvorak";
        kb_options = "grp:win_space_toggle";
      };
    };
  };

  home.stateVersion = "25.05";
}
