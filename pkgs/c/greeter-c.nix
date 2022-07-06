{ pkgs, stdenv, lib, fetchgit, buildLinguaFranca, lf-square}:
buildLinguaFranca {
    name = "greeter-c";
    version = "0.1.0";
    src = fetchgit {
        url = "https://gitea.tassilo-tanneberger.de/revol-xut/greeter-c.git";
        rev = "7e1150b611de440db2b3691988151b3855a8fd08";
        sha256 = "sha256-XJRoG5P8RsPFmQdXGplwf2m47+mFK6uPS0yQnAJoBwE=";
    };
    language = "c";
    mainReactor = "Main";
    buildInputs = [ lf-square ];
    meta = with lib; {

    };
}

