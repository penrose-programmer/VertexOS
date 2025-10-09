{ config, pkgs, ... }: {
programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-right = [ "tray" "idle_inhibitor" "cpu" "memory" "network" "pulseaudio" "battery" "clock"];
        modules-left = [ "hyprland/workspaces" ];

        clock = {
          interval = 1;
          format = "{:%r %d/%m/%Y}";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        "hyprland/window" = {
          separate-outputs = true;
        };

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = 3;
          };
        };

        cpu = {
          format = "CPU {usage}%";
          on-click = "kitty htop";
        };

        memory = {
          format = "MEM {}%";
          on-click = "kitty htop";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
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
          format-wifi = "{essid}";
          format-ethernet = "{ipaddr}/{cidr}";
          format-disconnected = "";
          on-click = "kitty nmtui";
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
    };

      style = ''
      * {
        border: none;
        outline: none;
        box-shadow: none;
        font-family: "JetBrainsMono", "Rubik", Helvetica, Arial, sans-serif;
        font-size: 14px;
        min-height: 0;
        background: none;
        color: #${config.stylix.base16Scheme.base05};
      }

      .modules-left {
        background: alpha( #${config.stylix.base16Scheme.base00}, 0.5);
        border-radius: 50px;
        padding: 4 2 4 2;
        margin: 10 0 0 10;
      }

      .modules-right {
        background: alpha( #${config.stylix.base16Scheme.base00}, 0.5);
        border-radius: 50px;
        padding: 4 0 4 2;
        margin: 10 10 0 0;
      }

      #workspaces button {
        background-color: alpha(#${config.stylix.base16Scheme.base01}, 0.5);
        margin: 0 1 0 1;
        border-radius: 0px;
        padding: 2 4 2 4;
      }

      #workspaces button:first-child {
        border-radius: 50 0 0 50;
        padding: 2 6 2 12;
        margin: 0 1 0 2;
      }

      #workspaces button:last-child {
        border-radius: 0 50 50 0;
        padding: 2 12 2 6;
        margin: 0 2 0 1;
      }

      #workspaces button:hover {
        background-color: shade( alpha(#${config.stylix.base16Scheme.base01}, 0.5), 0.9);
      }

      #workspaces button.visible {
        background-color: shade( #${config.stylix.base16Scheme.base0D}, 0.75);
      }

      #workspaces button.visible:hover {
        background-color: shade( #${config.stylix.base16Scheme.base0D}, 0.6);
      }

      #clock {
        min-width: 100px;
        padding: 0 10 0 10;
      }

      #battery {
        background-color: shade( #${config.stylix.base16Scheme.base0D}, 0.75);
        padding: 0 10 0 10;
        border-radius: 0 3 3 0;
        margin: 0 10 0 1;
      }

      #pulseaudio {
        background-color: shade( #${config.stylix.base16Scheme.base0D}, 0.75);
        border-radius: 0px;
        padding: 0 15 0 10;
        margin: 0 1 0 1;
        min-width: 50px;
      }

      #network {
        background-color: shade( #${config.stylix.base16Scheme.base0D}, 0.75);
        border-radius: 0px;
        padding: 0 10 0 10;
        margin: 0 1 0 1;
      }

      #memory {
        background-color: shade( #${config.stylix.base16Scheme.base0D}, 0.75);
        border-radius: 0px;
        padding: 0 10 0 10;
        margin: 0 1 0 1;
      }

      #cpu  {
        background-color: shade( #${config.stylix.base16Scheme.base0D}, 0.75);
        border-radius: 0px;
        padding: 0 15 0 10;
        margin: 0 1 0 1;
      }

      #idle_inhibitor {
        background-color: shade( #${config.stylix.base16Scheme.base0D}, 0.75);
        border-radius: 0px;
        border-radius: 50 0 0 50;
        padding: 0 15 0 10;
        margin: 0 1 0 1
      }

      #tray {
        padding: 0 5 0 10;
        margin: 0 1 0 2;
      }

      @keyframes blink
      {
        to
        {
          background-color: alpha(#${config.stylix.base16Scheme.base0F}, 0.8);
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
}
