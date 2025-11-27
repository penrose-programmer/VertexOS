{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/penrose/Pictures/samurai.jpg" ];
      wallpaper = [ ",/home/penrose/Pictures/samurai.jpg" ];
    };
  };
}
