{ ... }:

{
  # Enable SDDM.
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "Breeze";
    settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
      };
    };
  };
}
