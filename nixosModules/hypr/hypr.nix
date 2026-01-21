{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ hyprland hyprlock hypridle hyprpaper];
  
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
}
