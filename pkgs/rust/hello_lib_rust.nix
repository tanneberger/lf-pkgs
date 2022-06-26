{pkgs, buildLinguaFranca, fetchgit}: 
buildLinguaFranca {
  name = "hello-world-lib-rust";
  version = "0.1.0";

  src = fetchgit {
    url = "https://gitea.tassilo-tanneberger.de/revol-xut/hello-world-lib-rust.git";
    rev = "f3b0fb8f94bbbda92bba2deb8583e7d9067f8912";
    sha256 = "sha256-dy4bGHT9viALyVBpTOOAg0c/7nKOohCSEs/ZnVTWFXI=";
  };

  language = "rust";
  mainReactor = "Main";
}
