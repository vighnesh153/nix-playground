# let 
#   nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
#   pkgs = import nixpkgs { config = {}; overlays = []; };
# in

# let
#   pkgs = import <nixpkgs> {};
# in

{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/f9a41b180fabdad4c0a7ac40a76538d2311fa1b6.tar.gz") {}
}:

pkgs.mkShellNoCC {
  packages = with pkgs; [
    cowsay
    lolcat
  ];

  # Environment variables
  PIKACHU = "Pika, pi!";

  # Run something before
  shellHook = ''
    echo $PIKACHU | cowsay | lolcat
  '';
}
