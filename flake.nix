{
  description = "build script for the lingua-franca alarm clock";

  inputs = {
    utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nix-community/naersk";
    nixpkgs-mozilla.url = "github:mozilla/nixpkgs-mozilla";
  };

  outputs = inputs@{ self, utils, nixpkgs, naersk, nixpkgs-mozilla, ... }:
    let
      systems = with nixpkgs; [ "x86_64-linux" ]; #"aarch64-linux" ];
    in
    utils.lib.eachSystem systems (system:
      let
        pkgs = import nixpkgs {
          overlays = [
            #nixpkgs-mozilla.overlay.${system}
          ];
          inherit system;
        };

      in
      rec {
        lib.buildLinguaFranca = pkgs.callPackage ./pkgs/wrapper.nix {};
        #checks = packages;
        packages = pkgs.callPackages ./pkgs/root.nix {
          naersk = naersk.lib.${system};
        };
      }
    );
}
