{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = {
      base00 = "#161b22";
      base01 = "#30363d";
      base02 = "#484f58";
      base03 = "#6e7681";
      base04 = "#8b949e";
      base05 = "#c9d1d9";
      base06 = "#f0f6fc";
      base07 = "#ffffff";
      base08 = "#f85149";
      base09 = "#db6d28";
      base0A = "#bb8009";
      base0B = "#2ea043";
      base0C = "#2A9D9A";
      base0D = "#388bfd";
      base0E = "#a371f7";
      base0F = "#3D2F00";
    };

    image = "/Pictures/penrose.png";

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
