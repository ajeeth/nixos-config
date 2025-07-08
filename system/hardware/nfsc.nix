{ pkgs, lib, userSettings, ... }:

{
# NFS client mount with lazy-mounting. source: https://nixos.wiki/wiki/NFS
  
  fileSystems."/opt/nfs" = {
    device = "10.168.12.170:/mnt/pool1/10.168.12.51";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };
  # optional, but ensures rpc-statsd is running for on demand mounting  
  boot.supportedFilesystems = [ "nfs" ];
} 
