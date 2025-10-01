{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake .#nixos";
      testUpdate = "sudo nixos-rebuild test --flake .#nixos";
    };
  };
}
