{
  description = "My Nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:


    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."wsl-personal" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./modules/core.nix
          ./home-manager/profiles/wsl-personal.nix 
        ];
      };

      homeConfigurations."steamdeck" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./modules/core.nix
          ./home-manager/profiles/steamdeck.nix
        ];
      };

      homeConfigurations."wsl-work" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./modules/core.nix
          ./home-manager/profiles/wsl-work.nix
        ];
      };
    };
}
