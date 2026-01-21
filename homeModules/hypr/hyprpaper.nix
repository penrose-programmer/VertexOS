{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
	preload = [ "~/Pictures/Penrose.png" ];
	wallpaper = [ "~/Pictures/Penrose.png" ];
    };
  };
}
