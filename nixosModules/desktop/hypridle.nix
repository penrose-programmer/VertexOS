{ pkgs, ... }: {
  environment.systemPackages = pkgs.hypridle;

  hypridle.enable = true;
}
