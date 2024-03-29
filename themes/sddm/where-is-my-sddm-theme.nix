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

  #imgLink = "https://images.wallpaperscraft.com/image/single/fish_underwater_swim_113827_1600x1200.jpg";
  #imgSha256 = "04hx7s67bz5wxczcxh6zzi2kfvdkfiiy165i6rg09v196651mwsh";

  #imgLink = "https://images.wallpaperscraft.com/image/single/wood_leaves_nature_71206_1600x1200.jpg";
  #imgSha256 = "13nchm3biclyr0lggpbnz7c9ipzc5s14508087sjs8d41rm7p4mr";

  #imgLink = "https://images.wallpaperscraft.com/image/single/ocean_beach_aerial_view_134429_1600x1200.jpg";
  #imgSha256 = "1x3miyi9vz3b4hv4cfbhly96l0r19pxd0cci18d9hkmhxa7wg4vl";

  #imgLink = "https://images.wallpaperscraft.com/image/single/road_marking_trees_137674_1600x1200.jpg";
  #imgSha256 = "1j9gy7rk9zrzd943aprqsagw05zaa76zkz2z9333ax5xlm1wa99i";

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
    #rm theme.conf and set new conf
    cat <<EOT > theme.conf
    [General]
    passwordCharacter=-
    passwordFontSize=24
    sessionsFontSize=18
    usersFontSize=20
    background=Background.jpg
    backgroundMode=fill
    backgroundFill=#000000
    backgroundFillMode=aspect
    cursorColor=random
    EOT
   '';
}
