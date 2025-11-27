{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;

    targets = {
      hyprlock.enable = true;
      hyprlock.useWallpaper = false;

      waybar.enable = false;
    };

    base16Scheme = {
      path = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
    };

    fonts = {
      monospace = {
         package = pkgs.jetbrains-mono;
         name = "JetBrainsMono";
      };
      sansSerif = {
        package = pkgs.rubik;
        name = "Rubik";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
    };

    fonts.sizes = {
      applications = 10;
      terminal = 10;
      desktop = 8;
    };

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Classic";
    cursor.size = 20;
  };
}
