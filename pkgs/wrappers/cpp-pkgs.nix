{ fetchFromGitHub
, lingua-franca
, pkgs
, lib
, stdenv
, reactor
, attrib
}:
let 
  contains = lib.attrsets.hasAttr;
  buildInputs = if (contains "buildInputs" attrib) then (lib.getAttr "buildInputs" attrib) else []; 

  # TODO: this is wacky
  mainReactor = lib.getAttr "mainReactor" attrib;
  src = lib.getAttr "src" attrib;
  name = lib.getAttr "name" attrib;
  version = lib.getAttr "version" attrib;

  defaultBuildPhase = ''
    ${lingua-franca}/bin/lfc --external-runtime-path ${reactor}/ --output ./ ./src/${mainReactor}.lf
  '';

  defaultInstallPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/src
    cp -r ./bin/* $out/bin/
    cp ./bin/${mainReactor} $out/bin/${name}
    cp -r ./src/ $out/src
  '';

  # copies source files into the right place
  moveDependencies = (package: ''
    cp -r ${package}/src/* ./src/${package.name}/
  ''); 
  
  # this needs to expanded so only packages of the same language etc.
  filter = (package: (contains "lfPackage" package));

  # list of lingua-franca packages
  filtered_lingua_franca = builtins.filter filter buildInputs;

  # script of install commands that need to be performed
  installCommand = lib.strings.concatStringsSep "\n" (builtins.map moveDependencies filtered_lingua_franca);

  # this sets defaults if not specified
  patchPhase = attrib.patchPhase or "";
  buildPhase = attrib.buildPhase or defaultBuildPhase;
  installPhase = attrib.installPhase or defaultInstallPhase;

in stdenv.mkDerivation {
    name = name;
    version = version;
    src = src;

    buildInputs = with pkgs; [ lingua-franca which cmake git gcc10 ] ++ buildInputs;
    phases = [ "unpackPhase" "patchPhase" "buildPhase" "installPhase" ];

    patchPhase = installCommand + patchPhase;
    buildPhase = buildPhase;
    installPhase = installPhase;

    # meta information fields 
    language = "cpp";
    lfPackage = true;

    meta = attrib.meta or {};
}
