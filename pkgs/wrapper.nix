{pkgs, config, lib}:
/*
  {
    name = "";
    version = "";

    src =;

    language = ""; "cpp", "c", "python", "typescript", "rust"

    buildPhase = ''
    installPhase = ''
    pathPhae = ''
    etc
  }
*/
let
  inherit (lib) concatStrings foldl foldl' genAttrs literalExpression maintainers
                mapAttrsToList mkDefault mkEnableOption mkIf mkMerge mkOption
                optional types mkOptionDefault flip attrNames;

  reactor-cpp = pkgs.callPackage ./runtimes/reactor-cpp.nix { };

  reactor-c = pkgs.callPackage ./runtimes/reactor-cpp.nix { };

  runtime-map = {
    "cpp" = pkgs.callPackage ./wrappers/cpp-pkgs.nix;
    "c" = reactor-c;
  };

in (attrs:  let
  language = builtins.getAttr "language" attrs;
  runtime = builtins.getAttr language runtime-map;

in (runtime {attrib = attrs;}))
