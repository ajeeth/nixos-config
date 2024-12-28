{ pkgs, ... }:

{
  # enable KdeConnect
  #environment.systemPackages = [ pkgs.kdeconnect ];
  environment.systemPackages = [ pkgs.plasma5Packages.kdeconnect-kde ];
  programs.kdeconnect.enable = true;
}
