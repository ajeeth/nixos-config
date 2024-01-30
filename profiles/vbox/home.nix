{ config, pkgs, userSettings, ... }:

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
            ];

  home.packages = with pkgs; [
    # Core
    alacritty
    floorp
    brave
    dmenu
    rofi
    syncthing

    # Office
    libreoffice-fresh
    mate.atril
    texliveSmall

    # Media
    gimp-with-plugins
    vlc
    mpv
    ffmpeg
    movit
    mediainfo
    libmediainfo
    mediainfo-gui
    audio-recorder

    # Various dev packages
    texinfo
    libffi zlib
    nodePackages.ungit
  ];

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${userSettings.dotfilesDir}";
      XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
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

}
