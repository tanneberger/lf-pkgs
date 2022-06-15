{pkgs, lib}:
let
  buildLinguaFranca = pkgs.callPackage ./wrapper.nix {};
in rec {
  reactor-cpp = pkgs.callPackage ./runtimes/reactor-cpp.nix { };
  
  lfAlarmClock = pkgs.callPackage ./cpp/lf-alarm-clock.nix { 
    buildLinguaFranca = buildLinguaFranca;
    reactor-cpp = reactor-cpp;
  };
  helloLib = pkgs.callPackage ./cpp/hello_lib.nix { 
    buildLinguaFranca = buildLinguaFranca;
    reactor-cpp = reactor-cpp;
  };
  greeter = pkgs.callPackage ./cpp/greeter.nix { 
    buildLinguaFranca = buildLinguaFranca;
    reactor-cpp = reactor-cpp;
    helloLib = helloLib;
  };


}
