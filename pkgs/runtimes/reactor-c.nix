{ pkgs, stdenv, cmake, gcc, fetchFromGitHub}:
stdenv.mkDerivation {
  name = "reactor-c";

  src = fetchFromGitHub {
    owner = "lf-lang";
    repo = "reactor-c";
    rev = "f65b7a0491337770e5e81234210256004341a405";
    sha256 = "sha256-rkRw9dNdOA0Poy3dfLoL0JBF1KqSu0Nwx73Yi2ix56w=";
  };

  nativeBuildInputs = with pkgs; [ cmake gcc ];

  phases = [ "unpackPhase" "buildPhase" "installPhase"];

  buildPhase = ''
    ls -alh
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=./ ../
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -r ./ $out/bin
  '';
}
