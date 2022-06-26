{pkgs, config, lib, reactor-cpp, reactor-c, reactor-rust}:
let
  wrapper-map = {
    "cpp" = ./wrappers/cpp-pkgs.nix;
    "rust" = ./wrappers/rust-pkgs.nix;
    #"c" = reactor-c;
  };
  runtime-map = {
    "cpp" = reactor-cpp;
    "rust" = reactor-rust;
    "c" = reactor-c;
  };


in (attrs:  let
  language = builtins.getAttr "language" attrs;
  wrapper = builtins.getAttr language wrapper-map;
  runtime = builtins.getAttr language runtime-map;

in (pkgs.callPackage wrapper {
  attrib = attrs;
  reactor = runtime;
}))
