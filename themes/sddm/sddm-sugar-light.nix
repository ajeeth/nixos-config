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
  name = "sddm-sugar-light";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-light";
    rev = "c3b03080e203de7b0af91dde4f7d60bb9837a8cf";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
   '';
}
