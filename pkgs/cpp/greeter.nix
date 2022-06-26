{pkgs, buildLinguaFranca, fetchgit, lingua-franca, reactor-cpp, hello-lib}: 
buildLinguaFranca {
  name = "greeter";
  version = "0.1.0";

  src = fetchgit {
    url = "https://gitea.tassilo-tanneberger.de/revol-xut/simple-greeter.git";
    rev = "a9faf836242c00d0ab24e06c72082e052c880c5c";
    sha256 = "sha256-VjREJLUiHGQRUSVstNlaEtBt7zlV4cuU9tHzbx5Re3M=";
  };

  buildInputs = [ hello-lib ];

  language = "cpp";
  mainReactor = "Greet";
}
