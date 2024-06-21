# Nix

## Installing older versions of packages
You can checkout [this page](https://lazamar.co.uk/nix-versions/) to get the nixpkgs revision for packages.

For example if we wanted to install `cmakev3.22.1` then we could do:
```nix
packages = with pkgs; let
    cmakePKgs = import (builtins.fetchGit {
        # Descriptive name to make the store path easier to identify
        name = "my-old-revision";
        url = "https://github.com/NixOS/nixpkgs/";
        ref = "refs/heads/nixpkgs-unstable";
        rev = "f76bef61369be38a10c7a1aa718782a60340d9ff";
    }) {};
    in [
        android-studio
        sdk
        cmakePKgs.cmake
        nodejs_20
    ];
```
