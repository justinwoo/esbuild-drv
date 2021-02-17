{ pkgs ? import ./pinned.nix {} }:

let
  # from the esbuild@0.8.46 install.js
  # add more if needed.
  # const knownUnixlikePackages = {
  #   "darwin x64 LE": "esbuild-darwin-64",
  #   "darwin arm64 LE": "esbuild-darwin-64",
  #   "freebsd arm64 LE": "esbuild-freebsd-arm64",
  #   "freebsd x64 LE": "esbuild-freebsd-64",
  #   "linux arm LE": "esbuild-linux-arm",
  #   "linux arm64 LE": "esbuild-linux-arm64",
  #   "linux ia32 LE": "esbuild-linux-32",
  #   "linux mips64el LE": "esbuild-linux-mips64le",
  #   "linux ppc64 LE": "esbuild-linux-ppc64le",
  #   "linux x64 LE": "esbuild-linux-64"
  # };

  targets = {
    darwin-64 = pkgs.fetchurl {
      url = "http://registry.npmjs.org/esbuild-darwin-64/-/esbuild-darwin-64-0.8.46.tgz";
      sha256 = "0vaxn87aplmscnxhw4flk2w3wvmdfpcj0m9lwh7qcxd3sa44km43";
    };

    linux-64 = pkgs.fetchurl {
      url = "http://registry.npmjs.org/esbuild-linux-64/-/esbuild-linux-64-0.8.46.tgz";
      sha256 = "1f84fnwxvzgx09dzjy3lq086lkmg926bz7wmgqpwvm8c4pjcah0x";
    };
  };

  src =
    if pkgs.stdenv.isDarwin then targets."darwin-64"
    else if pkgs.stdenv.isLinux then targets."linux-64"
    else throw "Could not match a target for a esbuild binary.";
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
