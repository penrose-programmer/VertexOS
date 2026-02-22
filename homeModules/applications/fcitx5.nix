{ pkgs, ... }: {
  services.displayManager.cosmic-greeter.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    # Replace `yourUserName` with the actual username of user who should be automatically logged in
    user = "penrose";
  };

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;
}
