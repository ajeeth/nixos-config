# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, systemSettings, userSettings, ... }:
{
  imports =
    [ ../common/configuration.nix
      ../../system/hardware/systemd.nix # systemd config
      ../../system/hardware/kernel.nix # Kernel config
      ../../system/hardware/power.nix # Power management
      ../../system/hardware/opengl.nix
      ../../system/hardware/printing.nix
      ../../system/hardware/bluetooth.nix
      (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix") # My window manager
      ../../system/app/flatpak.nix
      ../../system/app/virtualization.nix
      ( import ../../system/app/docker.nix {storageDriver = "btrfs"; inherit userSettings lib;} )
      ../../system/security/blocklist.nix
      ../../system/security/firewall.nix
      ../../system/security/firejail.nix
      ../../system/security/openvpn.nix
      ../../system/security/automount.nix
      ../../system/style/stylix.nix
    ];

  # Kernel modules
  #boot.kernelModules = [ "i2c-dev" "i2c-piix4" "cpufreq_powersave" ];

  fonts.fontDir.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

}
