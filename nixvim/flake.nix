{
  description = "Nixvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.nixvim = {
      import = [
        nixvim.nixosModules.nixvim
        ./config/default.nix
      ];
    };
  };
}
