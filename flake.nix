{
  description = "jmandel1027's NixOS configurations and other Nix tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixlib.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , lix-module
    , home-manager
    , nix-darwin
    , nixos-hardware
    , nixos-generators
    }:
    let
      defaultSystems = [ "aarch64-darwin" ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs
          defaultSystems
          (system:
            let
              pkgs = import nixpkgs {
                inherit system;
                overlays = [ self.overlays.default ];
              };
            in
            f pkgs);
    in
    {

      darwinConfigurations = {
        block = import ./nix/hosts/block/host.nix {
          inherit self nixpkgs lix-module nix-darwin home-manager;
        };
      };

      # Nixpkgs overlays
      overlays = {
        default = nixpkgs.lib.composeManyExtensions [
          (final: prev: import ./nix/pkgs { pkgs = final; })
        ];

        installers = final: prev: final.callPackages ./nix/installers { inherit nixos-generators; };
      } // import ./nix/overlays;

      packages = forAllSystems (pkgs: {
        inherit (pkgs)
          envtpl
          tfenv;
      });

      nixosModules = import ./nix/modules;

      darwinModules = import ./nix/darwin-modules;

      hmModules = import ./nix/hm-modules;

      # custom templates
      templates = import ./nix/templates;

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShellNoCC {
          packages = [
            pkgs.just
            # formatting
            pkgs.lefthook
            self.formatter.${pkgs.system}
          ];
        };
      });

      formatter = forAllSystems (pkgs: pkgs.nixpkgs-fmt);

      checks = forAllSystems (pkgs: {
        check-format = pkgs.runCommand "check-format" { buildInputs = [ self.formatter.${pkgs.system} ]; } ''
          nixpkgs-fmt --check ${./.}
          touch "$out"
        '';
      });
    };

  nixConfig = {};
}
