{ pkgs, ... }: {
  environment.systemPackages = pkgs.hypridle;

  programs.hypridle.enable = true;
}
