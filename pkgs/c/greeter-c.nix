{ pkgs, stdenv, lib, fetchgit, buildLinguaFranca, lf-square}:
buildLinguaFranca {
    name = "greeter-c";
    version = "0.1.0";
    src = fetchgit {
        url = "https://gitea.tassilo-tanneberger.de/revol-xut/greeter-c.git";
        rev = "64545e7f2f0e75209d47ca55440cb1c29e7416d0";
        sha256 = "sha256-NAXUig3gRlY/BlBro7G7Cvbruc7WutSrfv3PL3RNsP8=";
    };
    language = "c";
    mainReactor = "Main";
    buildInputs = [ lf-square ];
    meta = with lib; {
      description = "small demo which uses other lingua-franca packages";
      homepage = "https://lf-lang.org";
      longDescription = ''
        Lorem Ipsum
      '';
      maintainers = with maintainers; [ tassilo ];
    };
}

