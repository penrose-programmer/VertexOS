{ pkgs, ... }: {
  programs.kitty = {
    enable = true;

    font.name = "Jetbrains Mono Nerd Font";
    font.size = 10;
  };
}
