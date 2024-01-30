{ pkgs, ... }:

{
  # Configure lightdm
  services.xserver.displayManager.lightdm.enable = true;
}
