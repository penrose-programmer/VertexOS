{ pkgs, ... }: {
  home.packages = with pkgs; [
    p3x-onenote
    obs-studio
    obsidian
  ];
}
