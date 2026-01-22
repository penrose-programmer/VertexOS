{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    material-design-icons
  ];
}
