{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/penrose/Pictures/Wallpaper.png" ];
      wallpaper = [ ",/home/penrose/Pictures/Wallpaper.png" ];
    };
  };
}
