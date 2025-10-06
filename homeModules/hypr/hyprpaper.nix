{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/penrose/Pictures/yourwallpaper.png" ];
      wallpaper = [ ",/home/penrose/Pictures/yourwallpaper.png" ];
    };
  };
}
