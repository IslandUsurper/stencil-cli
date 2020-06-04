let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  node2nix = pkgs.callPackage sources.node2nix {};
in
pkgs.mkShell {
  buildInputs = [
    node2nix.package
  ];
}
