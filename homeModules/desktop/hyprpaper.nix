{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/penrose/Pictures/Wallpaper.jpg" ];
      wallpaper = [ ",/home/penrose/Pictures/Wallpaper.jpg" ];
    };
  };
}
