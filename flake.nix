{
  description = "build script for the lingua-franca alarm clock";

  inputs = {
    utils.url = "github:numtide/flake-utils";
    nipkgs.url = "github:nixos/nixpkgs/nixos-22.05";
  };

  outputs = inputs@{ self, utils, nixpkgs, ... }:
  let 
    systems = with nixpkgs; [ "x86_64-linux" "aarch64-linux" ];
  in utils.lib.eachSystem systems (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      rec {
        #checks = packages;
        packages = pkgs.callPackage ./pkgs/root.nix {};
      }
    );
}
