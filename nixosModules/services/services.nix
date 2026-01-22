{ pkgs, ... }: {
  services.xserver.enable = false;
  services.desktopManager.gnome.enable = false;

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      cosmic-comp = super.cosmic-comp.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [ ./no_ssd.patch ];
      });
    })
  ];
  
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
