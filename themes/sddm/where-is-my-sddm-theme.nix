## use below to retrieve revision and sha256 for theme 
##  nix run github:seppeljordan/nix-prefetch-github stepanzubkov where-is-my-sddm-theme
##
## use below to retrieve sha256 for images
##  nix-prefetch-url "https://images.wallpaperscraft.com/image/single/peacocks_feathers_patterns_118604_1600x1200.jpg"

{ pkgs }:

let
  #imgLink = "https://images.wallpaperscraft.com/image/single/village_houses_mountain_193137_1920x1200.jpg";
  #imgSha256 = "1rlvjc31c4n3dp1k7s40pxcwz5lgc5vwpbmhmh69xj581adfbgc5";

  imgLink = "https://images.wallpaperscraft.com/image/single/peacocks_feathers_patterns_118604_1600x1200.jpg";
  imgSha256 = "0d586y5hk710n5zqf7ri1ijhpi8r5pgh7a02izzcgcmvcmf23xzv";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = imgSha256;
  };
in
pkgs.stdenv.mkDerivation {
  name = "where-is-my-sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "stepanzubkov";
    repo = "where-is-my-sddm-theme";
    rev = "1457631fa87dd4139d45bd9ef38359c13bf0b269";
    sha256 = "sha256-ONF+Gpg+PK+LFrDRulcKbdf9A51RuAYStrLAHev7pHI=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./where_is_my_sddm_theme/* $out/
    cd $out/
    #rm Background.jpg
    cp -r ${image} $out/Background.jpg
   '';
}
