{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    nixpkgs-chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };

    yandex-music.url = "github:cucumber-sp/yandex-music-linux";
  };

  outputs = { nixpkgs, nixpkgs-xr, nixpkgs-chaotic, disko, home-manager, ... } @ inputs: let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
    home-manager.users."destony".nixpkgs.config.allowUnfree = true;
    nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./core/core.nix
        nixpkgs-chaotic.nixosModules.default
        nixpkgs-xr.nixosModules.nixpkgs-xr
        disko.nixosModules.disko
      ];
    };
    homeConfigurations."destony" = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {
        inherit inputs;
      };
      inherit pkgs;
      modules = [
        ./home/home.nix
        inputs.yandex-music.homeManagerModules.default
      ];
    };
  };
}
