{ pkgs, ... }: {
  programs.thunar.enable = true;

  environment.systemPackages = with pkgs; [
    file-roller
    xfce.thunar-archive-plugin
  ];
}
