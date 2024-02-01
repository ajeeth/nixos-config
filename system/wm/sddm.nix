{ pkgs, ... }:

{
  # Enable SDDM.
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "${import ../../themes/sddm/sddm-sugar-dark-c.nix { inherit pkgs; }}";
  };
}
