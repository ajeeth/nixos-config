{ pkgs, lib, systemSettings, userSettings, ... }:
{
  imports =
    [ ../common/configuration.nix
      ../../system/hardware/systemd.nix # systemd config
      #../../system/hardware/opengl.nix
      (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix") # My window manager
      ../../system/app/flatpak.nix
      ../../system/style/stylix.nix
    ];

  fonts.fontDir.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

}
