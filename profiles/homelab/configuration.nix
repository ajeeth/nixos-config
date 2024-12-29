{ lib, pkgs, systemSettings, userSettings, ... }:

{
  imports =
    [ ../common/configuration.nix
      ../../system/hardware/systemd.nix # systemd config
      ../../system/security/sshd.nix
      ( import ../../system/app/docker.nix {inherit userSettings pkgs lib;} )
    ];


  # System packages
  environment.systemPackages = with pkgs; [
    #rclone
    #rdiff-backup
    #gocryptfs
    #cryfs
  ];

}
