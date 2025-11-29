{ pkgs, ... { pkgs, ... }: {
  home.packages = with pkgs; [
    gimp
  ];

  extraPlugins = with pkgs.gimpPlugins; [
    bimp
  ];
}
