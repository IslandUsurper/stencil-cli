{ sources ? import ./sources.nix }:

let
  pkgs = import sources.nixpkgs {};
in
pkgs.libsass.overrideAttrs (old: old // rec {
  version = "3.3.2";
  src = pkgs.fetchFromGitHub {
    owner = "sass";
    repo = "libsass";
    rev = version;
    sha256 = "1vq701xl54n5s3ijzm9zs765ivz4n055d518hks98mh898r6j1wc";
  };
})
