{ config, pkgs, ... }: {
programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;

        modules-left = [
          "hyprland/workspaces"
          "cpu"
          "memory"
        ];

        modules-center = ["clock"];

        modules-right = [
          "pulseaudio"
          "battery"
          "network"
          "bluetooth"
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

        "clock" = {
            "interval" = 1;
            "format" = "{:%H:%M:%S}";
            "max-length" = 25;
        };

        "pulseaudio" = {
          "format" = "{icon}  {volume}%";
          "format-muted" = "";
          "format-icons" = {
            "default" = ["" "" ""];
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

          "format" = "{icon} {capacity}%";
          "format-full" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{icon} {time}";
          "format-icons" = ["" "" "" "" ""];
        };

       "cpu" = {
           "format" = "CPU {icon}";
           "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };
        
        "memory" = {
           "format" = "MEM {icon}";
           "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };

        "network" = {
          "format-wifi" = "󰤢 ";
          "format-ethernet" = "󰈀 ";
          "format-disconnected" = "󰤠 ";
          "interval" = 5;
          "tooltip-format" = "{essid} ({signalStrength}%)";
          "on-click" = "kitty nmtui";
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
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", Helvetica, sans-serif;
        color: #ffffff;
        font-size: 12px;
        min-height: 0;

        background-color: #000000;
      }

      #pulseaudio,
      #battery,
      #network,
      #bluetooth,
      #cpu,
      #memory {
        padding: 0 10px;
      }

      label {
          all: unset;
      }
      button {
          all: unset;
      }
    '';
  };
}
