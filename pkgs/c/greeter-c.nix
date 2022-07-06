{ pkgs, stdenv, lib, fetchgit, buildLinguaFranca, lf-square}:
buildLinguaFranca {
    name = "greeter-c";
    version = "0.1.0";
    src = fetchgit {
        url = "https://gitea.tassilo-tanneberger.de/revol-xut/greeter-c.git";
        rev = "b5b836a35433ba0069732df97f4a31184c86562f";
        sha256 = "sha256-OsG6q5cZnst1YEOgJK8y8EzqeSCiQ3l4QGz2A4OLEGs=";
    };
    language = "c";
    mainReactor = "Main";
    buildInputs = [ lf-square ];
    meta = with lib; {

    };
}

