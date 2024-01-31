{ ... }:

{
  # Enable SDDM.
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "elarun";
    settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
      };
    };
  };
}
