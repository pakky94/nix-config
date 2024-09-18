{
  description = "My Nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    jovian-nixos.url = "github:Jovian-Experiments/Jovian-NixOS";
  };

  outputs = { nixpkgs, home-manager, jovian-nixos, ... } @inputs: {
    # NixOS profiles
    nixosConfigurations."steamdeck" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./modules/core.nix
        ./hosts/steamdeck
        home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.pakky = import ./hosts/steamdeck/home-manager.nix;
	}
        jovian-nixos.nixosModules.default
      ];
    };

    # Home manager standalone profiles
    homeConfigurations."wsl-personal" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./modules/core.nix
        ./home-manager/profiles/wsl-personal.nix
      ];
    };

    homeConfigurations."steamdeck" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./modules/core.nix
        ./home-manager/profiles/steamdeck.nix
      ];
    };

    homeConfigurations."wsl-work" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./modules/core.nix
        ./home-manager/profiles/wsl-work.nix
      ];
    };

  };
}
