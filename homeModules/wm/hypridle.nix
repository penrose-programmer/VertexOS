{ pkgs, ... }: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
          lock_cmd = "pidof hyprlock || hyprlock";       # avoid starting multiple hyprlock instances.
          before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
          after_sleep_cmd = "hyprctl dispatch dpms on";  # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = 60;
          on-timeout = "brightnessctl -s set 10%";         # lower brightness when timout has passed
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 900;
          on-timeout = "loginctl lock-session";            # lock screen when timeout has passed
        }

        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";        # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on";          # screen on when activity is detected after timeout has fired.
        }

        {
          timeout = 1800;
          on-timeout = "systemctl suspend";                # suspend pc
        }
      ];
    };
  };
}
