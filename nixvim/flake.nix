{
  description = "Nixvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      systems = ["x86_64-linux" "aarch64-linux"];
    in
      {
        nixosModules.nixvim = { config, pkgs, system, ... }:
          import ./config/default.nix { inherit pkgs system config; };
      };
}
