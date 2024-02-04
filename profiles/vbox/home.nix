{ config, pkgs, userSettings, systemSettings, inputs, plasma-manager, agenix, ... }:

{
  imports = [
              ../common/home.nix
              #stylix.homeManagerModules.stylix
              (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # My window manager selected from flake
              ../../user/shell/cli-collection.nix # Useful CLI apps
              (./. + "../../../user/app/browser"+("/"+userSettings.browser)+".nix") # My default browser selected from flake
              ../../user/app/flatpak/flatpak.nix # Flatpaks
              #../../user/style/stylix.nix # Styling and themes for my apps
              ../../user/lang/cc/cc.nix # C and C++ tools
              ../../user/app/ssh/ssh.nix 
              ../../user/app/keepass/keepass.nix 
              ../../user/app/browser/chromium.nix
              ../../user/app/nextcloud-client/nextcloud-client.nix
            ];

  home.packages = with pkgs; [
    # Core
    alacritty
    firefox
    brave
    dmenu

    # Office
    libreoffice-fresh
    mate.atril

    # Media
    gimp-with-plugins
    vlc
    mpv
    ffmpeg
    movit
    audio-recorder

    # Misc
    anki
    drawio
    vscode
    virtualbox
    microsoft-edge
    pdfarranger
    qbittorrent
    qownnotes
    remmina
    thunderbird
  ];

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${userSettings.dotfilesDir}";
    };
  };
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };

  # Use agenix to securly deploy ssh config file
  age.identityPaths = [ "${config.home.homeDirectory}/.ssh/${systemSettings.profile}_${userSettings.username}-id_ed25519" ];
  age.secrets.ssh_config = {
    file = ../../secrets/ssh_config.age;
    path = "${config.home.homeDirectory}/.ssh/config";
  };
}
