{ pkgs, ... }: {
  home.packages = with pkgs.hyprlandPlugins; [
    hyprscrolling
  ];
}
