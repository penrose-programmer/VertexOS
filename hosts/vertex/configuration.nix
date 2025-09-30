{ config, pkgs, inputs, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "vertex";

  # Enable networking
  networking.networkmanager = {
    enable = true;
  };

  # Time zone and locale
  time.timeZone = "Australia/Sydney";

  i18n.defaultLocale = "en_AU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable X11 and GNOME
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = false;

  services.libinput.touchpad.naturalScrolling = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
  };

  # Enable sound (PipeWire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Users
  users.users.penrose = {
    isNormalUser = true;
    description = "Talhah Ahmed";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.thunar.enable = true;

  stylix = {
    enable = true;
    autoEnable = false;

    image = pkgs.fetchurl {
      url = "https://wallpapers.com/images/high/rain-world-creature-encounter-mbw3d33fkvsproi4.webp";
    };

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Classic";
    cursor.size = 24;
   };

  fonts.packages = pkgs.nerd-fonts.jetbrains-mono;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  programs.nm-applet.enable = true;

  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
}
