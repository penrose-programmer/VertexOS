{ pkgs, ... }: {
  environment.systemPackages = pkgs.hypridle;

  services.hypridle.enable = true;
}
