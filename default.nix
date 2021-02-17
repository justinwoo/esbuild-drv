{ pkgs ? import <nixpkgs> { } }:

let
  src = pkgs.fetchurl {
    url = "http://registry.npmjs.org/esbuild-linux-64/-/esbuild-linux-64-0.8.46.tgz";
    sha256 = "1f84fnwxvzgx09dzjy3lq086lkmg926bz7wmgqpwvm8c4pjcah0x";
  };
in
pkgs.stdenv.mkDerivation {
  name = "esbuild";
  inherit src;
  installPhase = ''
    tar -xf $src
    mkdir -p $out/bin
    cp bin/esbuild $out/bin/esbuild
  '';
}
