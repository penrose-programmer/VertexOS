{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    systemd.enable = false;
    settings = {
      decoration = {
	shadow_offset = "0 5";
	"col.shadow" = "rgba(00000099)";
      };

      "$mod" = "SUPER";

      bind = [
	"$mainMod, T, exec, kitty"
	"$mainMod, E, exec, thunar"

	"$mainMod, Z, exec, firefox"

	"$mainMod, Q, killactive,"
	"$mainMod, F, fullscreen, 0"
	"$mainMod, M, exit,"
	
	"$mainMod, left, movefocus, l"
	"$mainMod, right, movefocus, r"
	"$mainMod, up, movefocus, u"
	"$mainMod, down, movefocus, d"

	"$mainMod SHIFT, T, togglefloating"

	"$mainMod, mouse_down, movetoworkspace, e+1"
	"$mainMod, mouse_up, movetoworkspace, e-1"

	", PRINT, exec, hyprshot -m region"
      ];

      # Startup Apps
      exec-once = [
	"hyprpanel"
      ];

      bindm = [
	# mouse movements
	"$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
	"$mod ALT, mouse:272, resizewindow"
      ];
    };
  }; 
}
