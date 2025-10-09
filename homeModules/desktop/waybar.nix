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
          "format" = "{%r %d/%m/%y}";
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
        background: transparent;
        color: #c6d0f5;
        margin: 0px;
        font-weight: 500;
      }

      #workspaces {
        background-color: #1a1b26;
        padding: 3px;
        margin: 5px 0px; 
        min-width: 0;
        border: none;
        /* Transition for background-color and color only */
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }

      #workspaces {
        margin-left: 3px; /* Margin from the far left edge */
        margin-right: 3px; /* Spacing after the workspaces module */
      }

      #workspaces button {
        color: #babbf1;
        border-radius: 5px; /* Workspaces buttons are always rounded */
        padding: 0.3rem 0.6rem;
        background: transparent;
        transition: all 0.2s ease-in-out;
        border: none;
        outline: none;
      }

      #workspaces button.active {
        color: #99d1db;
        background-color: rgba(153, 209, 219, 0.1);
        box-shadow: inset 0 0 0 1px rgba(153, 209, 219, 0.2);
      }

      #workspaces button:hover {
        background: rgb(41, 42, 53); /* Reference bright hover color */
        color: #c6d0f5;
      }

      #clock {
        background-color: #1a1b26;
        padding: 0.3rem 0.7rem;
        margin: 5px 0px;
        border-radius: 6px; /* This module is always rounded */
        box-shadow: 0 1px 3px rgba(153, 209, 219, 0.2);
        min-width: 0;
        border: none;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }

      #clock:hover {
        background-color: rgba(153, 209, 219, 0.1); /* Brighter highlight */
      }

      #bluetooth,
      #pulseaudio,
      #network,
      #custom-lock,
      #battery {
        background-color: #1a1b26;
        padding: 0.3rem 0.7rem;
        margin: 5px 0px; 
        border-radius: 0;
        box-shadow: none;
        min-width: 0;
        border: none;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }

      #bluetooth:hover,
      #pulseaudio:hover,
      #network:hover,
      #custom-lock:hover,
      #battery:hover {
        background-color: rgb(41, 42, 53);
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
        color: #99d1db;
        font-weight: 500;
      }

      #pulseaudio {
        color: #c6d0f5;
      }

      #network {
        color: #c6d0f5;
      }

      #network.disconnected {
        color: #e78284;
      }

      #custom-lock {
        color: #babbf1;
      }

      #bluetooth {
        color: #888888;
        font-size: 16px;
      }

      #bluetooth.on {
        color: #2196f3;
      }

      #bluetooth.connected {
        color: #99d1db;
      }

      #battery {
        color: #99d1db;;
      }

      #battery.charging {
        color: #a6d189;
      }

      #battery.warning:not(.charging) {
        color: #e78284;
      }

      tooltip {
        background-color: #1a1b26;
        color: #dddddd;
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
