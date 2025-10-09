{ config, pkgs, ... }: {
programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        "layer": "top",
        "position": "top",
        "margin-bottom": -10,
        "spacing" : 0,
        "modules-left": [
          "hyprland/workspaces",
          "custom/uptime",
          "cpu",
        ],

        "modules-center": ["clock"],

        "modules-right": [
          "custom/pomodoro",
          "bluetooth",
          "network",
          "pulseaudio", 
          "backlight",
          "battery",
        ],

        "hyprland/workspaces": {
          "format": "{name}: {icon}",
          "format-icons": {
            "active": "",
            "default": ""
          }
        },

        "bluetooth": {
          "format": "󰂲",
          "format-on": "{icon}",
          "format-off": "{icon}", 
          "format-connected":"{icon}",
          "format-icons":{
            "on":"󰂯",
            "off": "󰂲",
            "connected": "󰂱",
          },
          "on-click": "blueman-manager",
          "tooltip-format-connected":"{device_enumerate}"
        },

        "clock": {
          "timezone": "Asia/Kolkata",
          "tooltip": false,
          "format": "{:%H:%M:%S  -  %A, %d}",
          "interval": 1
        },

        "network": {
          "format-wifi": "󰤢",
          "format-ethernet": "󰈀 ",
          "format-disconnected": "󰤠 ",
          "interval": 5,
          "tooltip-format": "{essid} ({signalStrength}%)",
          "on-click": "nm-connection-editor"
        },

        "cpu": {
        "interval": 1,
        "format": "  {icon0}{icon1}{icon2}{icon3} {usage:>2}%",
        "format-icons": ["▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"],
        "on-click": "ghostty -e htop"
        },

        "memory": {
        "interval": 30,
        "format": "  {used:0.1f}G/{total:0.1f}G",
        "tooltip-format": "Memory"
        },

        "custom/uptime": {
        "format": "{}",
        "format-icon": [""], 
        "tooltip": false,
        "interval": 1600,
        "exec": "$HOME/.config/waybar/scripts/uptime.sh"
        },

        "backlight": {
          "format": "{icon}  {percent}%",
          "format-icons": ["","󰃜", "󰃛", "󰃞","󰃝","󰃟","󰃠"],
          "tooltip": false
        },

        "pulseaudio": {
        "format": "{icon}  {volume}%",
        "format-muted": "",
        "format-icons": {
        "default": ["", "", " "]
        },
        "on-click": "pavucontrol"
        },

        "battery": {
          "interval":2,
          "states": {
              "good": 95,
              "warning": 30,
              "critical": 15
          },
          "format": "{icon}  {capacity}%",
          "format-full": "{icon}  {capacity}%",
          "format-charging": " {capacity}%",
          "format-plugged": " {capacity}%",
          "format-alt": "{icon} {time}",
          // "format-good": "", // An empty format will hide the module
          // "format-full": "",
          "format-icons": ["", "", "", "", ""]
        },

        "custom/lock": {
          "tooltip": false,
          "on-click": "sh -c '(sleep 0s; hyprlock)' & disown",
          "format" : ""
        },

        "custom/pomodoro": {
          "format": "{}",
          "return-type": "json",
          "exec": "waybar-module-pomodoro --no-work-icons",
          "on-click": "waybar-module-pomodoro toggle",
          "on-click-right": "waybar-module-pomodoro reset",
        },

      }

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
        all: unset;
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
