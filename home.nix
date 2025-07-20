{ config, pkgs, inputs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "penrose";
  home.homeDirectory = "/home/penrose";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    neofetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  programs.git = {
    enable = true;
    userName = "penrose";
    userEmail = "syedtalhahahmed@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake .#nixos";
      test-update = "sudo nixos-rebuild test --flake .#nixos";
    };
  };
  
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-right = [ "tray" "idle_inhibitor" "cpu" "memory" "pulseaudio" "network" "battery" "clock" "custom/notification"];
        modules-center = [ "hyprland/window" ];
        modules-left = [ "hyprland/workspaces" ];
        "idle_inhibitor"= {
            format = "{icon}";
            format-icons = {
                activated = "";
                deactivated = "";
            };
        };
        "custom/notification" = {
          tooltip = false;
          format = "{} {icon}";
          "format-icons" = {
            notification = "󱅫";
            none = "";
            "dnd-notification" = " ";
            "dnd-none" = "󰂛";
            "inhibited-notification" = " ";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = " ";
            "dnd-inhibited-none" = " ";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          exec = "swaync-client -swb";
          "on-click" = "sleep 0.1 && swaync-client -t -sw";
          "on-click-right" = "sleep 0.1 && swaync-client -d -sw";
          escape = true;
        };

        clock = {
          interval = 1;
          format = "{:%r %d/%m/%Y}";
        };

        "hyprland/window" = {
          separate-outputs = true;
        };

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = 3;
          };
        };

        cpu.format = "CPU {usage}%";
        memory.format = "MEM {}%";

        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
            "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            phone-muted = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
            ];
          };
          scroll-step = 1;
          on-click = "pavucontrol";
        };

        network = {
          format = "{ifname}";
          format-wifi = "{essid} ({signalStrength}%)";
          format-ethernet = "{ipaddr}/{cidr}";
          format-disconnected = "";
        };

        battery = {
          format = "{capacity}% {icon}";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          interval = 5;
          states = {
            warning = 30;
            critical = 10;
          };
          tooltip = false;
        };
    };

    style = ''
      * {
        border: none;
        font-family: "Rubik", "JetBrainsMono Nerd Font", Helvetica, Arial, sans-serif;
        font-size: 14px;
        min-height: 0;
        background: none;
        color: @theme_text_color;
      }

      #waybar {
        background: @theme_bg_color;
      }

      #tray menu {
        background: @theme_bg_color;
      }

      .module {
        margin: 0 10px 0;
      }


     #workspaces button:hover {
       background-color: shade(@theme_bg_color, 1.8);
     }

     #workspaces button.visible {
        background-color: shade(#${config.stylix.base16Scheme.base0D}, 0.8);
     }

     #workspaces button.visible:hover {
        background-color: #${config.stylix.base16Scheme.base0D};
     }

     #clock {
         min-width:  200px;
     }

     #battery {
      padding: 0 10px;
     }
     @keyframes blink
     {
       to
       {
         background-color: #${config.stylix.base16Scheme.base08};
       }
     }

     #battery.critical:not(.charging)
     {
       animation-name            : blink;
       animation-duration        : 1s;
       animation-timing-function : linear;
       animation-iteration-count : infinite;
       animation-direction       : alternate;
     }
    '';
  };

  services.hypridle.enable = true;
  services.hypridle.settings = {
    general = {
        lock_cmd = "pidof hyprlock || hyprlock";       # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on";  # to avoid having to press a key twice to turn on the display.
    };

    listener = [
      {
        timeout = 120;
        on-timeout = "brightnessctl -s set 10%";
        on-resume = "brightnessctl -r";
      }
      {
        timeout = 150;
        on-timeout = "loginctl lock-session";            # lock screen when timeout has passed
      }

      {
        timeout = 180;
        on-timeout = "hyprctl dispatch dpms off";        # screen off when timeout has passed
        on-resume = "hyprctl dispatch dpms on";          # screen on when activity is detected after timeout has fired.
      }

      {
        timeout = 1800;                                # 30min
        on-timeout = "systemctl suspend";                # suspend pc
      }
    ];
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
        "$mod, B, exec, zengg"
        "ALT, SPACE, exec, walker"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
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

      exec-once = [ 
        "hypridle"
        "waybar"
        "hyprpaper"
      ];
    };
  };

  

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}