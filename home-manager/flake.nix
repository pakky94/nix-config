{
  description = "Home Manager configuration of pakky";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
          ./config.nix
          ./profiles/wsl-personal.nix 
        ];
      };

      homeConfigurations."wsl-work" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./config.nix
          ./profiles/wsl-work.nix
        ];
      };
    };
}
