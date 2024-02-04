{ pkgs, ... }:

{
  # enable KdeConnect
  environment.systemPackages = [ pkgs.kdeconnect ];
  programs.kdeconnect.enable = true;
}