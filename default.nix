{ sources ? import ./nix/sources.nix,
  pkgs ? import sources.nixpkgs { inherit system; },
  system ? builtins.currentSystem
}:

let
  libsass = import ./nix/libsass.nix { inherit sources; };
  stencil = import ./stencil-cli.nix {
    inherit pkgs system;
  };
in
(stencil.package.override {
  buildInputs = [ libsass pkgs.nodePackages.node-gyp pkgs.pkgconfig ];
}).overrideAttrs (old: {
  LIBSASS_EXT = "auto";
})
