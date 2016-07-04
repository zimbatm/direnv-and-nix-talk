{ pkgs ? import <nixpkgs> { }
, stdenv ? pkgs.stdenv
, bundlerEnv ? pkgs.bundlerEnv
, plantuml ? pkgs.plantuml
, jre ? pkgs.jre
}:
stdenv.mkDerivation rec {
  name = "direnv-and-nix";

  env = bundlerEnv {
    name = "direnv-and-nix-gems";
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };

  src = ./.;

  buildInputs = [ env plantuml jre ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out
    cp -r index.html desk.js $out/
  '';

  dontPatchELF = true;
  dontPatchShebangs = true;
  dontStrip = true;
}
