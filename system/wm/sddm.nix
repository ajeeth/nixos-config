{ ... }:

{
  # Enable SDDM.
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "breeze";
    settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
      };
    };
  };
}
