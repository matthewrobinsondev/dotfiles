{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# custom flakes
		wezterm = {
			url = "github:wez/wezterm/main?dir=nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, ... }@inputs: 
		let
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
			customWezterm = inputs.wezterm.defaultPackage.${system}; # This will load the default package from the `wezterm` flake
		in {
			nixosConfigurations.nixos = lib.nixosSystem {
				specialArgs = {inherit inputs;};
				inherit system;
				modules = [
					./configuration.nix
				];
			};
			homeConfigurations = {
				matt = inputs.home-manager.lib.homeManagerConfiguration {
					inherit pkgs;
					modules = [
						./home.nix
					];
					extraSpecialArgs = {inherit inputs;};
				};
			};
		};
}
