{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ hyprland hyprlock hypridle ];
}
