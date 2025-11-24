{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/penrose/Pictures/BeachCaveWallpaper.webp" ];
      wallpaper = [ ",/home/penrose/Pictures/BeachCaveWallpaper.webp" ];
    };
  };
}
