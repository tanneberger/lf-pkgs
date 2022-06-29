# Lingua Franca Packages


## How to Contribute Packages

Assuming you have a lingua-franca project setup with [Weaver](https://github.com/revol-xut/weaver) 
you can call **weaver publish** which generates nix code which should look aproximetiely like this:

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

Now you can build the package with:

```
    $ nix build .#packages."x86_64-linux".simple-greeter
```

## Installing Nix

### Package-Source

**Arch**

```bash
    pacman -S nix
```

- https://wiki.archlinux.org/title/Nix

**Debian**

```bash
    sudo apt install nix-bin
```

**Darwin + Eveybody else**

```bash
    $ sh <(curl -L https://nixos.org/nix/install)
```

### Setting Up

This might only be required when you install nix from the package manager of your distribution.

```bash
    systemctl enable nix-daemon.service # enabling builder
    usermod -a -G nix-users your_username # group to interface with builder
```

### Enabling Flakes (Required)

Nix flakes is very fancy new feature which the project uses.

```bash
    echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
```




