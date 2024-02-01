## use below to retrieve revision and sha256 for theme 
##  nix run github:seppeljordan/nix-prefetch-github Kangie sddm-sugar-candy
##
## use below to retrieve sha256 for images
##  nix-prefetch-url "https://images.wallpaperscraft.com/image/single/peacocks_feathers_patterns_118604_1600x1200.jpg"

{ pkgs }:

let
  #imgLink = "https://images.wallpaperscraft.com/image/single/village_houses_mountain_193137_1920x1200.jpg";
  #imgSha256 = "1rlvjc31c4n3dp1k7s40pxcwz5lgc5vwpbmhmh69xj581adfbgc5";

  #imgLink = "https://images.wallpaperscraft.com/image/single/peacocks_feathers_patterns_118604_1600x1200.jpg";
  #imgSha256 = "0d586y5hk710n5zqf7ri1ijhpi8r5pgh7a02izzcgcmvcmf23xzv";

  #imgLink = "https://images.wallpaperscraft.com/image/single/fish_underwater_swim_113827_1600x1200.jpg";
  #imgSha256 = "04hx7s67bz5wxczcxh6zzi2kfvdkfiiy165i6rg09v196651mwsh";

  #imgLink = "https://images.wallpaperscraft.com/image/single/wood_leaves_nature_71206_1600x1200.jpg";
  #imgSha256 = "13nchm3biclyr0lggpbnz7c9ipzc5s14508087sjs8d41rm7p4mr";

  imgLink = "https://images.wallpaperscraft.com/image/single/ocean_beach_aerial_view_134429_1600x1200.jpg";
  imgSha256 = "1x3miyi9vz3b4hv4cfbhly96l0r19pxd0cci18d9hkmhxa7wg4vl";

  #imgLink = "https://images.wallpaperscraft.com/image/single/road_marking_trees_137674_1600x1200.jpg";
  #imgSha256 = "1j9gy7rk9zrzd943aprqsagw05zaa76zkz2z9333ax5xlm1wa99i";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = imgSha256;
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-sugar-candy";
  src = pkgs.fetchFromGitHub {
    owner = "Kangie";
    repo = "sddm-sugar-candy";
    rev = "a1fae5159c8f7e44f0d8de124b14bae583edb5b8";
    sha256 = "sha256-p2d7I0UBP63baW/q9MexYJQcqSmZ0L5rkwK3n66gmqM=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./where_is_my_sddm_theme/* $out/
    cd $out/
    rm Backgrounds/Mountain.jpg
    cp -r ${image} $out/Backgrounds/Mountain.jpg
}
