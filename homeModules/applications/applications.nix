{ pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
    p3x-onenote
    obs-studio
    obsidian
    godot_4_5
    lazygit
    mpg123
    neofetch
    nodejs_22
    pnpm
    gcc
    portablemc
    ripgrep
  ];
}
