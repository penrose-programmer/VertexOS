{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/penrose/Pictures/space.jpg" ];
      wallpaper = [ ",/home/penrose/Pictures/space.jpg" ];
    };
  };
}
