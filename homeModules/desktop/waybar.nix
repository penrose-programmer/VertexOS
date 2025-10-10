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
          "format" = "{%r %d/%m/%Y}";
          "interval" = 1;
        };

        "network" = {
          "format-wifi" = "󰤢";
          "format-ethernet" = "󰈀 ";
          "format-disconnected" = "󰤠 ";
          "interval" = 5;
          "tooltip-format" = "{essid} ({signalStrength}%)";
          "on-click" = "nm-connection-editor";
        };

        "pulseaudio" = {
          "format" = "{icon}  {volume}%";
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
          "format" = "{icon}  {capacity}%";
          "format-full" = "{icon}  {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{icon} {time}";
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
        background: #ffffff;
        color: #${config.stylix.base16Scheme.base05};
        margin: 0px;
        font-weight: 500;
      }

      #workspaces {
        background-color: #${config.stylix.base16Scheme.base00};
        margin: 5px;
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
        border-radius: 6px;
        min-width: 0;
        border: none;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
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
        box-shadow: none;
        min-width: 0;
        border: none;
      }

      #bluetooth {
        margin-left: 0px; 
        border-top-left-radius: 6px;
        border-bottom-left-radius: 6px;
      }

      #battery {
        border-top-right-radius: 6px;
        border-bottom-right-radius: 6px;
        margin-right: 7px;
      }

      #clock {
        color: #E6E1CF; /* base05 - main text */
        font-weight: 500;
      }

      #pulseaudio {
        color: #FFB454; /* base0A - warm accent */
      }

      #network {
        color: #FFB454; /* base0A - warm accent */
      }

      #network.disconnected {
        color: #F07178; /* base08 - error/red */
      }

      #custom-lock {
        color: #FFB454; /* base0A - warm accent */
      }

      #bluetooth {
        color: #BFBDB6; /* base04 - muted text */
        font-size: 16px;
      }

      #bluetooth.on {
        color: #FFB454; /* base0A - warm accent */
      }

      #bluetooth.connected {
        color: #E6E1CF; /* base05 - main text */
      }

      #battery {
        color: #E6E1CF; /* base05 - main text */
      }

      #battery.charging {
        color: #B8CC52; /* base0B - green/success */
      }

      #battery.warning:not(.charging) {
        color: #F07178; /* base08 - warning */
      }

      tooltip {
        background-color: #131721; /* base01 - tooltip background */
        color: #E6E1CF; /* base05 - tooltip text */
        padding: 5px 12px;
        margin: 5px 0px;
        border-radius: 6px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        font-size: 12px;
      }
    '';
  };
}
