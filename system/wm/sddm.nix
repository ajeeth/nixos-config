{ ... }:

{
  # Enable SDDM.
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "maya";
    settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
      };
    };
  };
}
