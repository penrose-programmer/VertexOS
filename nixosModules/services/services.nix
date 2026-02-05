{ pkgs, ... }: {
  services.xserver.enable = false;
  services.desktopManager.gnome.enable = false;
  
  # Enable the COSMIC login manager
  services.displayManager.cosmic-greeter.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    # Replace `yourUserName` with the actual username of user who should be automatically logged in
    user = "penrose";
  };

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  services.blueman.enable = true;

  services.libinput.touchpad.naturalScrolling = true;

  services.xserver.xkb = {
    layout = "us";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
