{
  description = "Nixvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.nixvim = import ./config/default.nix;
  };
}
