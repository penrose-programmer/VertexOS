{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = pkgs.base16-schemes.ayu-dark;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Classic";
    cursor.size = 20;
  };
}
