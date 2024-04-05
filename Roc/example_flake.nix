{
  # You can also just use the template in the current directory
  # nix flake init --template github:roc-lang/roc#simple --refresh

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    roc.url = "github:roc-lang/roc";
  };

  outputs = {
    nixpkgs,
    roc,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        rocPkgs = roc.packages.${system};
      in {
        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              rocPkgs.cli
            ];
          };
        };
      }
    );
}
