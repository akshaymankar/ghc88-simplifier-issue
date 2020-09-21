{ghcVersion ? "8102" }:
let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
in with pkgs; pkgs.mkShell {
  name = "ghc88-simplifier-issue";
  buildInputs = [
    haskell.compiler."ghc${ghcVersion}"
    haskellPackages.cabal-install
    ncurses
    zlib
  ];
}
