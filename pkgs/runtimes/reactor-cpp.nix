{ pkgs, stdenv, cmake, gcc, fetchFromGitHub}:
let
  debug = false;
  buildMode = if debug then "Debug" else "Release";
in
stdenv.mkDerivation rec {
  name = "reactor-cpp";

  src = fetchFromGitHub {
    owner = "lf-lang";
    repo = "reactor-cpp";
    rev = "09f5a93972530771dc715ff2ac2f78b92a6b6f48";
    sha256 = "mow1x5AgMsjoSZ/sCRC+CDy2lfV4brXlJK1+D1BKuUc=";
  };

  nativeBuildInputs = with pkgs; [ cmake gcc ];

  phases = [ "unpackPhase" "buildPhase" "installPhase"];

  buildPhase = ''
    ls -alh
    cp -r ${src} ./
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=${buildMode} -DCMAKE_INSTALL_PREFIX=./ ../
    make install
  '';

  installPhase = ''
    cp -r ./ $out/
  '';
}
