{ pkgs, ... }:

{
  # Enable SDDM.
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "${import ../../themes/sddm/where-is-my-sddm-theme.nix { inherit pkgs; }}";
    extraConfig = ''
      [General]
      InputMethod=
    '';
  };
}
