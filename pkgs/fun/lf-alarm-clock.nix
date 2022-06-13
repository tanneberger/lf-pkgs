{pkgs, buildLinguaFranca, fetchFromGitHub, lingua-franca, reactor-cpp}: 
buildLinguaFranca {
  name = "lf-alarm-clock";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "revol-xut";
    repo = "lf-alarm-clock";
    rev = "93c2f97dd82406cf566e2cc4170892b577c4a0b1";
    sha256 = "sha256-uHwh/vwInqC7RdvVJRgkrwbLzik7JjoiA5quCpYHK2g=";
    fetchSubmodules = true;
  };

  buildInputs = with pkgs; [ boost169 git ];
  language = "cpp";
  mainReactor = "AlarmClock";

  buildPhase = ''
    ls -alh
    ${lingua-franca}/bin/lfc --external-runtime-path ${reactor-cpp}/ src/AlarmClock.lf
  '';
}
