{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/penrose/Pictures/Wallpaper.jpeg" ];
      wallpaper = [ ",/home/penrose/Pictures/Wallpaper.jpeg" ];
    };
  };
}
