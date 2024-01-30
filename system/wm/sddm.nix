{ ... }:

{
  # Enable SDDM.
  services.xserver.displayManager.sddm = {
    enable = true;
    settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
      };
    };
  };
}
