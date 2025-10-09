{ config, pkgs, ... }: {
programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-right = [ "network" "pulseaudio" "battery" "clock"];
        modules-left = [ "hyprland/workspaces" ];

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
        font-family: "JetBrainsMono Nerd Font",  Arial, sans-serif;
        font-size: 12px;
        min-height: 0;
        background: none;
        color: #${config.stylix.base16Scheme.base05};
      }

      .modules-left {
        background: alpha( #${config.stylix.base16Scheme.base00}, 0.5);
        border-radius: 5px;
        padding: 4 2 4 2;
        margin: 10 0 0 10;
      }

      .modules-right {
        background: alpha( #${config.stylix.base16Scheme.base00}, 0.5);
        border-radius: 5px;
        padding: 4 0 4 2;
        margin: 10 10 0 0;
      }


      #workspaces {
        padding: 0 4 0 4;
      }

      #workspaces button {
        all: unset;
        margin: 0 3px;
        border-radius: 50%;
        background-color: alpha(#${config.stylix.base16Scheme.base03}, 0.7);
        transition: background 0.2s ease, transform 0.15s ease;
      }

      #workspaces button:hover {
        background-color: alpha(#${config.stylix.base16Scheme.base04}, 0.9);
      }

      #workspaces button.visible,
      #workspaces button.active {
        background-color: #${config.stylix.base16Scheme.base07}; /* white-ish */
      }

      #workspaces button.urgent {
        background-color: #${config.stylix.base16Scheme.base08}; /* red-ish */
      }

      #workspaces button label {
        display: none;
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
