{ pkgs, ... }:

{
  # Enable SDDM.
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "${import ../../themes/sddm/sddm-sugar-candy.nix { inherit pkgs; }}";
    settings = {
      General = {
        InputMethod = "";
      };
    };
  };
}
