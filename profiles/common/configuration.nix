{ lib, pkgs, systemSettings, userSettings, ... }:

{
  imports =
    [ ../../system/hardware-configuration.nix
      ../../system/hardware/time.nix # Network time sync
      ../../system/security/doas.nix
      ../../system/security/gpg.nix
    ];

  # Fix nix path
  nix.nixPath = [ "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
                  "nixos-config=${userSettings.dotfilesDir}/profiles/${systemSettings.profile}/configuration.nix"
                  "/nix/var/nix/profiles/per-user/root/channels"
                ];

  # Nix Package Manager optimization
  nix = {                                               
    settings ={
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # Ensure nix flakes are enabled
  #nix.package = pkgs.nixFlakes;
  nix.package = pkgs.nixVersions.stable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # I'm sorry Stallman-taichou
  nixpkgs.config.allowUnfree = true;

  # Kernel modules
  boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];

  # Bootloader
  boot.loader.timeout = 2;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Networking
  networking.hostName = systemSettings.hostname; # Define your hostname.
  networking.networkmanager.enable = true; # Use networkmanager

  # Timezone and locale
  time.timeZone = systemSettings.timezone; # time zone
  i18n.defaultLocale = systemSettings.locale;
  i18n.extraLocaleSettings = {
    LC_ALL = systemSettings.locale;
    LC_ADDRESS = systemSettings.locale;
    LC_CTYPE = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # User account
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    uid = 1000;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIRoiVQZAWzai1hVhjpx2g9Xvbe6jh3h55PxQsB7VlKK ajeeth.samuel@gmail.com"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFURJoAvAEzCMSnWk1H5mx1H3ySzXpOwBuI1O54ulP/+t/yHU7vNk571UOOxGzxvPmFRD2y8KLje7NzEwRFEYBC+HGF1YtDyz5EDni1pakiEPsAaHBSpqUmi1b0oCss/B5x6Bikw4AeQZ5SVLaBRIoCS+oDT3sln82cuNZGCfAA4AQzch+GuvUISA68mAR2ru/fJoppWHMrkrR3Dw0CcHuLfLGKDfhuxPA3DcOvDh8e9jeWYm0uO+DZFimOPh41p/SeEA1+wEbsxdL3NGCS2+qj52jHGbg1TCzmIFitbUFpklk8kscELZi67W7AZYjSRzXWgs8PVJcHlUX9Wbueuxp job@AGH00099"
    ];
  };

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    bash
    git
    cryptsetup
    home-manager
  ];

  # use bash
  environment.shells = with pkgs; [ bash ];
  users.defaultUserShell = pkgs.bash;
  #programs.bash.enable = true; #no longer required

  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "24.11";

}
