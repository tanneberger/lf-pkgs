# Lingua Franca Packages

## Package Manager frontend 

If you are looking for a easy to use frontend there is [barrel](https://github.com/revol-xut/barrel).

## Wrapping a Lingua Franca package in nix

Barrel produces a output similar too this with `barrel publish`:

```nix
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
```

Then add yourself under `maintainers/maintainers-list.nix` and add the package to
`pkgs/root.nix`.


## Installing Nix for non NixOS systems

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

**Darwin + Everybody else**

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




