{ pkgs, stdenv, lib, fetchgit, buildLinguaFranca}:
buildLinguaFranca {
    name = "lf-square";
    version = "0.1.0";
    src = fetchgit {
        url = "https://gitea.tassilo-tanneberger.de/revol-xut/lf-add.git";
        rev = "9a84f6429aa6b979e77ed38d76d8514f221a598b";
        sha256 = "sha256-6AermTynIleUyXVbWNFlsYsWP6zNLzQN1WXwGsD4gTg=";
    };
    language = "c";
    mainReactor = "Main";
    buildInputs = [  ];
    meta = with lib; {

    };
}
