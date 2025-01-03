{ pkgs, ... }:

{
  # import X11 config
  imports = [ ./x11.nix
              ./sddm.nix
              ../app/kdeconnect.nix
            ];

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable KDE Partition Manager
  programs.partition-manager.enable = true;

  environment = {
    systemPackages = with pkgs; [
      # tools
      akonadi
      ark
      #dragon
      filelight
      kate
      kcalc
      #kdenlive
      kdiff3
      konsole
      kfind
      kget
      kgpg
      #kmplot
      #labplot
      #syncthingtray
      #tokodon
      #wacomtablet

      # integration
      #libsForQt5.kaccounts-integration
      #libsForQt5.kaccounts-providers
      #libsForQt5.kio-gdrive
    ];
  };
}
