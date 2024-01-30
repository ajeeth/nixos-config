{ ... }:

{
  # import X11 config
  imports = [ ./x11.nix
              ./sddm.nix
            ];

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.desktopManager.plasma5.enable = true;
}
