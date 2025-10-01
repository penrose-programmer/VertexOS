{ pkgs, ... }: {
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = false;
  
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
