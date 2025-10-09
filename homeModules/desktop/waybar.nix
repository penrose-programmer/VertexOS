{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-right = [ "pulseaudio" "network" "battery" "clock" ];
        modules-left = [ "hyprland/workspaces" ];

        "idle_inhibitor"= {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
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
          scroll-step = 2;
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
    };
    style = ''
      * {
        border: none;
        font-family: "JetBrainsMono Nerd Font", Arial, sans-serif;
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
       background-color: shade(#000000, 1.8);
     }

     #workspaces button.visible {
        background-color: shade(#ffffff, 0.8);
     }

     #workspaces button.visible:hover {
        background-color: #ffffff;
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
         background-color: #ffffff;
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
  };
}
