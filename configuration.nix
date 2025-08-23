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

  services.ollama = {
    enable = true;
    loadModels = [ "llama3.1:8b" "gemma3:12b" ];
  };

  stylix = {
    base16Scheme = {
        base00 = "212121";
        base01 = "303030";
        base02 = "353535";
        base03 = "4A4A4A";
        base04 = "B2CCD6";
        base05 = "EEFFFF";
        base06 = "EEFFFF";
        base07 = "FFFFFF";
        base08 = "cf462d"; # Coral
        base09 = "bd561d"; # Orange
        base0A = "9e6a03"; # Yellow
        base0B = "238636"; # Green
        base0C = "1D8281"; # Teal
        base0D = "1f6feb"; # Blue
        base0E = "8957e5"; # Purple
        base0F = "da3633"; # Red
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
