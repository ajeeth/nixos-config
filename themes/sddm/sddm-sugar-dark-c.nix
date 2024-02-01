{ pkgs }:

let
  imgLink = "https://images.wallpaperscraft.com/image/single/village_houses_mountain_193137_1920x1200.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "1rlvjc31c4n3dp1k7s40pxcwz5lgc5vwpbmhmh69xj581adfbgc5";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
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
