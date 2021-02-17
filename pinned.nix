{ pkgs ? import <nixpkgs> {} }:

import
  (
    pkgs.fetchFromGitHub {
      owner = "nixos";
      repo = "nixpkgs";
      rev = "dbf2880790424fdfcef9d09a24a14556bdbb301f";
      sha256 = "0bc1hhxzwvlb2nl4rg4qpw061v393mlmnl1g8v86w4l0kvvq8c0b";
    }
  )
  {}
