{ ... }:

{
  # import X11 config
  imports = [ ./x11.nix
            ];

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager = {
    sddm.enable = true;
    sddm.settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
      };
    };
    plasma5.enable = true;
  };
}
