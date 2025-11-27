{ config, pkgs, ... }: {
programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        "layer" = "top";
        "position" = "top";

        "margin-left" = 10;
        "margin-top" = 10;
        "margin-right" = 10;
        "spacing" = 0;

        "height" = 10;

        "modules-left" = [
          "hyprland/workspaces"
        ];

        "modules-center" = [];

        "modules-right" = [
          "bluetooth"
          "network"
          "pulseaudio" 
          "battery"
          "clock"
          "custom/lock"
        ];

        "hyprland/workspaces" = {
          "persistent-workspaces" = {
            "*" = 3;
          };
          "format" = "{icon}";
          "format-icons" = {
            "default" = "";
          };
        };

        "bluetooth" = {
          "format" = "󰂲";
          "format-on" = "{icon}";
          "format-off" = "{icon}"; 
          "format-connected" = "{icon}";
          "format-icons" = {
            "on" = "󰂯";
            "off" = "󰂲";
            "connected" = "󰂱";
          };
          "on-click" = "blueman-manager";
          "tooltip-format-connected" = "{device_enumerate}";
        };

        "clock" = {
          "tooltip" = false;
          "format" = "{:%r}";
          "interval" = 1;
        };

        "network" = {
          "format-wifi" = "󰤢";
          "format-ethernet" = "󰈀";
          "format-disconnected" = "󰤠";
          "interval" = 5;
          "tooltip-format" = "{essid} ({signalStrength}%)";
          "on-click" = "kitty nmtui";
        };

        "pulseaudio" = {
          "format" = "{icon}";
          "format-muted" = "";
          "format-icons" = {
            "default" = ["" "" ""];
          };
          "on-click" = "pavucontrol";
        };

        "battery" = {
          "interval" = 2;
          "states" = {
              "good" = 95;
              "warning" = 30;
              "critical" = 15;
          };
          "format" = "{icon}";
          "format-full" = "{icon}";
          "format-charging" = "";
          "format-plugged" = "";
          "format-alt" = "{icon}";
          "format-icons" = ["" "" "" "" ""];
        };

        "custom/lock" = {
          "tooltip" = false;
          "on-click" = "sh -c '(sleep 0s; hyprlock)' & disown";
          "format" = "";
        };
      };
    };

    style = ''
      * {
        background: transparent;
        font-family: "JetBrainsMono Nerd Font", Helvetica, sans-serif;
        font-size: 12px;
        min-width: 7px;
        min-height: 0px;
        border-radius: 0px;
      }

      #workspaces,
      #bluetooth,
      #network,
      #pulseaudio,
      #battery,
      #clock,
      #custom-lock {
        background-color: #${config.stylix.base16Scheme.base00};
        font-weight: 500;
      }

      #workspaces,
      #clock,
      #custom-lock {
        border: 2px solid #${config.stylix.base16Scheme.base01};
      }

      #network,
      #pulseaudio,
      #bluetooth,
      #battery {
        border-top: 2px solid #${config.stylix.base16Scheme.base01};
        border-bottom: 2px solid #${config.stylix.base16Scheme.base01};
      }

      #bluetooth {
        border-left: 2px solid #${config.stylix.base16Scheme.base01};
      }

      #battery {
        border-right: 2px solid #${config.stylix.base16Scheme.base01};
      }

      #workspaces button {
        color: #${config.stylix.base16Scheme.base05};
      }

      #workspaces button:hover {
          box-shadow: inherit;
          text-shadow: inherit;
      }

      #workspaces button.active {
        color: #${config.stylix.base16Scheme.base0D};
      }

      #bluetooth,
      #network,
      #pulseaudio,
      #battery {
        color: #${config.stylix.base16Scheme.base0E};
      }

      #clock {
        color: #${config.stylix.base16Scheme.base0D};
      }

      #custom-lock {
        color: #${config.stylix.base16Scheme.base05};
      }

      #clock {
        margin: 0px 5px;
      }

      #workspaces,
      #bluetooth,
      #network,
      #battery,
      #clock {
        padding: 0px 5px;
      }

      #pulseaudio {
        padding: 0px 7px 0px 5px;
      }

      #workspaces button {
        padding: 0px 7px 0px 4px;
      }

      #custom-lock {
        padding: 0px 8px 0px 4px;
      }

      tooltip {
        background-color: #131721; /* base01 - tooltip background */
        color: #E6E1CF; /* base05 - tooltip text */
        padding: 5px 12px;
        margin: 10px 0px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        font-size: 12px;
      }
    '';
  };
}
