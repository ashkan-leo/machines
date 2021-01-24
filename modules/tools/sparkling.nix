{ config, lib, pkgs, stdenv, ... }:
stdenv.mkDerivation {
  name = "spark";

  src = pkgs.fetchFromGithub {
    owner = "holman";
    repo = "spark";
    rev = "HEAD";
    sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
  };

  installPhase = ''
    mkdir $out/bin
    cp ./spark $out/
  '';
  # sparkling = pkgs.runCommand "spark" { } ''
  #   mkdir -p $out/bin
  #   cp ${SPARK}/spark $out/bin/spark
  # '';
}
