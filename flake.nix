{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    stylix.url = "github:nix-community/stylix/release-25.05";

    home-manager = { 
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    textfox = {
      url = "github:adriankarlen/textfox";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    {
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.penrose = ./home.nix;
          }
        ];
      };
      homeConfigurations."penrose@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          inputs.textfox.homeManagerModules.default
        ];
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.penrose = ./home.nix;
        }
      };
    };
}
