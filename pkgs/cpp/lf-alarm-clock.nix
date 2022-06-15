{pkgs, buildLinguaFranca, fetchFromGitHub, lingua-franca, reactor-cpp}: 
buildLinguaFranca {
  name = "lf-alarm-clock";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "revol-xut";
    repo = "lf-alarm-clock";
    rev = "d7e1265fa9a24484ed2bd3eb63ec9d3781ec0228";
    sha256 = "sha256-K3qK1oYo27nSlj3WnTgfUr7CPaaUk71Ixb5EjftyTX8=";
    fetchSubmodules = true;
  };

  buildInputs = with pkgs; [ git boost ];
  language = "cpp";
  mainReactor = "AlarmClock";

  buildPhase = ''
    ls -alh
    ${lingua-franca}/bin/lfc --external-runtime-path ${reactor-cpp}/ src/AlarmClock.lf
  '';
}
