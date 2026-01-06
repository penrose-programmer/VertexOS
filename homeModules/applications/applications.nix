{ pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
    p3x-onenote
    obs-studio
    obsidian
    godot
    lazygit
    mpg123
    neofetch
    nodejs_22
    pnpm
    gcc
    portablemc
    ripgrep
    blender
    musescore
    gimp3-with-plugins
    inkscape
    ungoogled-chromium
    butler
    zed-editor
  ];
}
