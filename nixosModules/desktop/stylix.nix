{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Classic";
    cursor.size = 20;
    
    fonts = {
      monospace = {
         package = pkgs.jetbrains-mono;
         name = "Jetbrains Mono Nerd Font";
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

    image = ./space.jpg;
  };
}
