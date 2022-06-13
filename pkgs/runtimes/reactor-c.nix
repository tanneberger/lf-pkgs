{ pkgs, stdenv, cmake, gcc, fetchFromGithub, debug }:
let
  buildMode = if debug then "Debug" else "Release";
in
stdenv.mkDerivation {
  name = "cpp-lingua-franca-runtime";
  src = fetchFromGithub {
    owner = "lf-lang";
    repo = "reactor-c";
    rev = "f65b7a0491337770e5e81234210256004341a405";
    sha256 = "";
  };

  nativeBuildInputs = with pkgs; [ cmake gcc ];

  phases = ["buildPhase", "installPhase"];

  buildPhase = ''
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=${buildMode} -DCMAKE_INSTALL_PREFIX=./ ../
    make install
  '';

  installPhase = ''
    cp -r ./ $out/
  '';
}
