# Lingua Franca Packages

## Package Manager frontend 

If you are looking for a easy to use frontend there is [barrel](https://github.com/revol-xut/barrel).

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




