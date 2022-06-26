{ naersk, src, lib, fetchFromGitHub, pkg-config}:
naersk.buildPackage {
  pname = "reactor-rt";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "revol-xut";
    repo = "reactor-rust";
    rev = "6537f7ca41fade9e2ad9a3ef1549ab8f6543c49b";
    sha256 = "sha256-6UheJ8Fw8NRv6SxSGZMP4kElyr77/KesDhv9YuPU2u4=";
  };

  cargoSha256 = lib.fakeSha256;
  copyLibs = true;

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ ];

  installPhase = ''
    mkdir -p $out/lib
    cp target/release/libreactor_rt.d $out/lib/
    cp target/release/libreactor_rt.rlib $out/lib/
  '';

  meta = with lib; {
    description = "rust runtime for lingua-franca";
    homepage = "https://github.com/lf-lang/reactor-rust";
  };
}
