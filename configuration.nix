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
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager = {
    enable = true;
  };

  networking.firewall.trustedInterfaces = [ "virbr0" ];

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
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = false;

  services.libinput.touchpad.naturalScrolling = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # Enable printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint ];

  # Enable sound (PipeWire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu.runAsRoot = true;
    qemu.package = pkgs.qemu_kvm;
  };

  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.libvirtd.qemu.swtpm.enable = true;

  # Users
  users.users.penrose = {
    isNormalUser = true;
    description = "Talhah Ahmed";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System-wide packages
  environment.systemPackages = with pkgs; [
    # Terminal
    kitty
    gh

    # Desktop
    waybar
    hypridle
    hyprpaper
    dunst
    rofi
    pavucontrol
    tlp

    # Applications
    inputs.zen-browser.packages."${system}".default
    zed-editor
    obsidian
    xfce.thunar
    p3x-onenote

    # Screenshot
    grim
    swappy
    slurp
    wl-clipboard
  ];

  stylix = {
    base16Scheme = {
        base00 = "0a506e";
        base01 = "585f62";
        base02 = "653b27";
        base03 = "cc8f62";
        base04 = "66a1b8";
        base05 = "e5dccb";
        base06 = "58c5cd";
        base07 = "548851";
        base08 = "e35b22";
        base09 = "d19742";
        base0A = "cc8f62";
        base0B = "84dcd4";
        base0C = "58c5cd";
        base0D = "66a1b8";
        base0E = "653b27";
        base0F = "66a1b8";
      };
      enable = true;
      autoEnable = true;

      cursor.package = pkgs.bibata-cursors;
      cursor.name = "Bibata-Modern-Classic";
      cursor.size = 24;

      fonts = {
        monospace = {
           package = pkgs.jetbrains-mono;
           name = "JetBrainsMono";
        };
        sansSerif = {
          package = pkgs.rubik;
          name = "Rubik";
        };
        serif = {
          package = pkgs.noto-fonts;
          name = "Noto Serif";
        };
      };
      image = ./wallpaper/hk-wallpaper.jpeg;
      opacity = {
        terminal = 0.8;
        desktop = 0.5;
      };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    rubik
    noto-fonts
  ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  programs.nm-applet.enable = true;

  # Programs
  programs.firefox.enable = true;
  programs.git.enable = true;

  programs.hyprland.enable = true;

  programs.hyprlock.enable = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System state version
  system.stateVersion = "25.05";
}
