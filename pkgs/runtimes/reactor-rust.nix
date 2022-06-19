{ naersk, src, lib, fetchFromGitHub, pkg-config}:

naersk.buildPackage {
  pname = "reactor-rust";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "revol-xut"; #TODO: change to main repo
    repo = "reactor-rust";
    rev = "6537f7ca41fade9e2ad9a3ef1549ab8f6543c49b";
    sha256 = "sha256-6UheJ8Fw8NRv6SxSGZMP4kElyr77/KesDhv9YuPU2u4=";
  };

  cargoSha256 = lib.fakeSha256;

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ ];

  meta = with lib; {
    description = "Simple rust server which collects data from telegram stations";
    homepage = "https://github.com/dump-dvb/data-accumulator";
  };
}
