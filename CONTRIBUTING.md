## How to Contribute Packages

Assuming you have a lingua-franca project setup with [Weaver](https://github.com/revol-xut/weaver) 
you can call **weaver publish** which generates nix code which should look approximately like this:

```
 pkgs/cpp/simple-greeter.nix


{ pkgs, stdenv, lib, buildLinguaFranca, hello-lib}:
buildLinguaFranca {
    name = "simple-greeter";
    version = "0.1.0";
    src = fetchgit {
        url = "https://gitea.tassilo-tanneberger.de/revol-xut/simple-greeter.git";
        rev = "6535efde5d52b94debc7cbd8e0ec3b277cde5d17";
        sha256 = "";
    };
    language = "cpp";
    mainReactor = "Greet";
    buildInputs = [ hello-lib ];
    meta = with lib; {

    };
}

 pkgs/root.nix

simple-greeter = pkgs.callPackage ./cpp/simple-greeter.nix {
      hello-lib = hello-lib;
}
```

Move the pregenerated code inside the corresponding files and try to build you package with.

```
    $ nix build .#packages."x86_64-linux".simple-greeter
```

The package will now probably complain that you have not specifed any sha256 hash
take the hash that nix generates and add it into the open field in the fetchgit function.

