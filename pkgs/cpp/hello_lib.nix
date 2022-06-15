{pkgs, buildLinguaFranca, fetchgit, lingua-franca, reactor-cpp}: 
buildLinguaFranca {
  name = "hello-world-lib";
  version = "0.1.0";

  src = fetchgit {
    url = "https://gitea.tassilo-tanneberger.de/revol-xut/hello-world-lib.git";
    rev = "a4289947c525ecd661411ce90ae14d5dd4e37fa5";
    sha256 = "sha256-c9ld3OqL3Q1mSXm4Dm63euGLAgU8AoDKftDjmFJHOn8=";
  };

  language = "cpp";
  mainReactor = "Main";
}
