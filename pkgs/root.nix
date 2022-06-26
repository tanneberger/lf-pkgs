{pkgs, lib, naersk}:
let
  rt-cpp = pkgs.callPackage ./runtimes/reactor-cpp.nix { };
  rt-c = pkgs.callPackage ./runtimes/reactor-c.nix { };
  rt-rust = pkgs.callPackage ./runtimes/reactor-rust.nix { 
    naersk = naersk;
  };

  buildLinguaFranca = pkgs.callPackage ./wrapper.nix {
    reactor-cpp = rt-cpp;
    reactor-c = rt-c;
    reactor-rust = rt-rust;
  };

in rec {
  reactor-cpp = rt-cpp;
  reactor-c = rt-c;
  reactor-rust = rt-rust;

  lf-alarm-alock = pkgs.callPackage ./cpp/lf-alarm-clock.nix { 
    buildLinguaFranca = buildLinguaFranca;
  };
  hello-lib = pkgs.callPackage ./cpp/hello_lib.nix { 
    buildLinguaFranca = buildLinguaFranca;
  };
  greeter = pkgs.callPackage ./cpp/greeter.nix { 
    buildLinguaFranca = buildLinguaFranca;
    hello-lib = hello-lib;
  };
}
