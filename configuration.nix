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
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" "dialout" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System-wide packages
  environment.systemPackages = with pkgs; [

    # Desktop
    waybar
    hypridle
    dunst
    rofi
    pavucontrol
    tlp

    # Applications
    vscode
    thonny
    obsidian
    xfce.thunar
    p3x-onenote
    obs-studio
    fabric-ai
    vlc
    htop

    # Screenshot
    grim
    swappy
    slurp
    wl-clipboard

    # Misc
    udisks
  ];

  services.ollama = {
    enable = true;
    loadModels = [ "gemma3:4b" "llama3.1:8b" "qwen3:14b" ];
  };

  stylix = {
    base16Scheme = {
        base00 = "1e1e2e"; # base
        base01 = "181825"; # mantle
        base02 = "313244"; # surface0
        base03 = "45475a"; # surface1
        base04 = "585b70"; # surface2
        base05 = "cdd6f4"; # text
        base06 = "f5e0dc"; # rosewater
        base07 = "b4befe"; # lavender
        base08 = "f38ba8"; # red
        base09 = "fab387"; # peach
        base0A = "f9e2af"; # yellow
        base0B = "a6e3a1"; # green
        base0C = "94e2d5"; # teal
        base0D = "89b4fa"; # blue
        base0E = "cba6f7"; # mauve
        base0F = "f2cdcd"; # flamingo
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
  programs.firefox = {
    enable = true;
  };

  programs.git.enable = true;

  programs.hyprland.enable = true;

  programs.hyprlock.enable = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System state version
  system.stateVersion = "25.05";
}
