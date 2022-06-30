{ pkgs, stdenv, lib, fetchgit, buildLinguaFranca}:
buildLinguaFranca {
    name = "lf-square";
    version = "0.1.0";
    src = fetchgit {
      url = "https://gitea.tassilo-tanneberger.de/revol-xut/lf-add.git";
      rev = "a6ddac070a729c590dff9293a6d3e40b06068df0";
      sha256 = "sha256-RW8UvLJNQ3CE0QIGNSwL+Fau4BsJ8WEv4EH7P2jI29Y=";
    };
    language = "c";
    mainReactor = "SquareTest";
    buildInputs = [  ];
    meta = with lib; {

    };
}
