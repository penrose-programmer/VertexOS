{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;

    targets = {
      hyprlock.enable = false;
      waybar.enable = false;
    };

    base16Scheme = {
      base00 = "#101010";
      base01 = "#252525";
      base02 = "#464646";
      base03 = "#525252";
      base04 = "#ababab";
      base05 = "#b9b9b9";
      base06 = "#e3e3e3";
      base07 = "#f7f7f7";

      base08 = "#ff5f5f"; # red

      base09 = "#999999";
      base0A = "#a0a0a0";
      base0B = "#8e8e8e";
      base0C = "#868686";

      base0D = "#5f87ff"; # blue

      base0E = "#747474";
      base0F = "#5e5e5e";
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
