{ pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/penrose/Pictures/Subterranean.png" ];
      wallpaper = [ ",/home/penrose/Pictures/Subterranean.png" ];
    };
  };
}
