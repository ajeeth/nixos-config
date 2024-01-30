{ ... }:

{
  # import X11 config
  imports = [ ./x11.nix
              ./sddm.nix
            ];

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.desktopManager.plasma5.enable = true;

  environment = {
    systemPackages = with pkgs; [
      # tools
      akonadi
      ark
      dragon
      filelight
      kamoso
      kate
      kcalc
      #kdenlive
      kdiff3
      konsole
      kfind
      kget
      kgpg
      kmplot
      labplot
      qttools
      quazip
      syncthingtray
      tokodon
      wacomtablet

      # integration
      kaccounts-integration
      kaccounts-providers
      kio-gdrive
    ];
  };
}
