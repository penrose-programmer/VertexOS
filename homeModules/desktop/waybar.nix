{ config, pkgs, ... }: {
programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        "layer" = "top";
        "position" = "top";
        "margin-bottom" = -10;
        "spacing" = 0;
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
            "active" = "";
            "default" = "";
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
          "format-ethernet" = "󰈀 ";
          "format-disconnected" = "󰤠 ";
          "interval" = 5;
          "tooltip-format" = "{essid} ({signalStrength}%)";
          "on-click" = "kitty nmtui";
        };

        "pulseaudio" = {
          "format" = "{icon}";
          "format-muted" = "";
          "format-icons" = {
            "default" = ["" "" " "];
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
          "format-charging" = " ";
          "format-plugged" = " ";
          "format-alt" = "{icon}";
          "format-icons" = ["" "" "" "" ""];
        };

        "custom/lock" = {
          "tooltip" = false;
          "on-click" = "sh -c '(sleep 0s; hyprlock)' & disown";
          "format" = "";
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", Helvetica, sans-serif;
        font-size: 13px;
        min-height: 0;
        padding-right: 0px;
        padding-left: 0px;
        padding-bottom: 0px;
      }

      #waybar {
        background: transparent;
        color: #${config.stylix.base16Scheme.base05};
        margin: 0px;
        font-weight: 500;
      }

      #workspaces {
        background-color: #${config.stylix.base16Scheme.base00};
        padding-right: 5px;
        margin: 5px;
        border-radius: 5px;
        min-width: 0;
        border: none;
      }

      #workspaces button {
        color: #${config.stylix.base16Scheme.base05};
        padding: 4px 6px;
        margin: 0 3px;
        border: none;
        background: transparent;
        outline: none;
        box-shadow: none;
        min-width: 0;
        min-height: 0;
      }

      #workspaces button:focus {
        outline: none;
        box-shadow: none;
      }

      #clock {
        background-color: #${config.stylix.base16Scheme.base00};
        padding: 0.3rem 0.7rem;
        margin: 5px 0px;
        border-radius: 5px;
        min-width: 0;
        border: none;
      }

      #bluetooth,
      #pulseaudio,
      #network,
      #custom-lock,
      #battery {
        background-color: #${config.stylix.base16Scheme.base00};
        padding: 0.3rem 0.7rem;
        margin: 5px 0px; 
        border-radius: 0;
        min-width: 0;
        border: none;
      }

      #bluetooth,
      #network,
      #pulseaudio
      #battery {
        color: #${config.stylix.base16Scheme.base07};
      }

      #custom-lock {
        margin: 5px;
        border-radius: 5px;
      }

      #bluetooth {
        margin-left: 5px; 
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
      }

      #battery {
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        margin-right: 5px;
      }

      tooltip {
        background-color: #131721; /* base01 - tooltip background */
        color: #E6E1CF; /* base05 - tooltip text */
        padding: 5px 12px;
        margin: 10px 0px;
        border-radius: 5px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        font-size: 12px;
      }
    '';
  };
}
