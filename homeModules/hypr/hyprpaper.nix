{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/penrose/Pictures/Penrose.png" ];
      wallpaper = [ ",/home/penrose/Pictures/Penrose.png" ];
    };
  };
}
