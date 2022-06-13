{ fetchFromGitHub
, lingua-franca
, pkgs
, lib
, stdenv
, attrib
}:
let 
  contains = lib.attrsets.hasAttr;

  patchPhase = if (contains "patchPhase" attrib) then (lib.getAttr "patchPhase" attrib) else "";
  buildPhase = if (contains "buildPhase" attrib) then (lib.getAttr "buildPhase" attrib) else defaultBuildPhase;
  installPhase = if (contains "installPhase" attrib) then installPhase else defaultInstallPhase; 
  buildInputs = if (contains "buildInputs" attrib) then (lib.getAttr "buildInputs" attrib) else []; 

  # TODO: this is wacky
  mainReactor = lib.getAttr "mainReactor" attrib;
  src = lib.getAttr "src" attrib;
  name = lib.getAttr "name" attrib;
  version = lib.getAttr "version" attrib;

  reactor-cpp = pkgs.callPackage ../runtimes/reactor-cpp.nix { };

  defaultBuildPhase = ''
    ${lingua-franca}/bin/lfc --external-runtime-path ${reactor-cpp}/ --output ./ ${src}/src/${mainReactor}.lf
  '';

  defaultInstallPhase = ''
    find ./
    mkdir -p $out/bin
    mkdir -p $out/src
    cp -r ./bin/* $out/bin/
    cp -r ./src/ $out/src
  '';

in stdenv.mkDerivation {
    name = name;
    version = version;
    src = src;

    buildInputs = with pkgs; [ lingua-franca which cmake git gcc10 ] ++ buildInputs;
    phases = [ "unpackPhase" "patchPhase" "buildPhase" "installPhase"];

    patchPhase = patchPhase;
    buildPhase = buildPhase;
    installPhase = installPhase;
}
