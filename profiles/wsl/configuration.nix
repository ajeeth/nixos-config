# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, pkgs, systemSettings, userSettings, ... }:

with lib;
#let
#  nixos-wsl = import ./nixos-wsl;
#in
{
  imports =
    [ 
      #nixos-wsl.nixosModules.wsl
      ../common/configuration.nix
      #../../system/hardware/kernel.nix # Kernel config
      ../../system/hardware/systemd.nix # systemd config
      ../../system/hardware/opengl.nix
      ../../system/hardware/printing.nix
      #../../system/hardware/bluetooth.nix
      #../../system/security/blocklist.nix
      #../../system/security/firewall.nix
      #../../system/security/firejail.nix
      #../../system/style/stylix.nix
    ];

  wsl = {
    enable = true;
    automountPath = "/mnt";
    defaultUser = userSettings.username;
    startMenuLaunchers = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;

  };

  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

}
