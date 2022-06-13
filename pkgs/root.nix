{pkgs, lib}:
let
  buildLinguaFranca = pkgs.callPackage ./wrapper.nix {};
in rec {
  reactor-cpp = pkgs.callPackage ./runtimes/reactor-cpp.nix { };
  
  lf-alarm-clock = pkgs.callPackage ./fun/lf-alarm-clock.nix { 
    buildLinguaFranca = buildLinguaFranca;
    reactor-cpp = reactor-cpp;
  };
}
