{ pkgs, lib, userSettings, ... }:

{
# NFS client mount with lazy-mounting. source: https://nixos.wiki/wiki/NFS
  
#  fileSystems."/opt/nfs" = {
#    device = "10.168.12.170:/mnt/pool1/10.168.12.51";
#    fsType = "nfs";
#    options = [ "x-systemd.automount" "noauto" ];
#  };

  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true; # needed for NFS

  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = "noatime";
    };
    what = "10.168.12.170:/mnt/pool1/10.168.12.51";
    where = "/opt/nfs";
  }];

  systemd.automounts = [{
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/opt/nfs";
  }];

} 
