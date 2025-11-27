{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = {
      base00 = "0B0F14";  # background
      base01 = "1A1F26";  # surface
      base02 = "2A2F3A";  # subtle dividers
      base03 = "5C6270";  # muted text
      base04 = "A0A4A8";  # secondary text
      base05 = "E0E2E4";  # primary text
      base06 = "F5F7FA";  # highlights
      base07 = "FFFFFF";  # bright highlights
      base08 = "FF6C6B";  # red
      base09 = "FBA922";  # orange
      base0A = "FFCC00";  # yellow
      base0B = "98C379";  # green
      base0C = "56B6C2";  # cyan
      base0D = "61AFEF";  # blue
      base0E = "C678DD";  # magenta
      base0F = "D19A66";  # brown / accent
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

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Classic";
    cursor.size = 20;
  };
}
