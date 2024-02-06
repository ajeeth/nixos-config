{ config, pkgs, stylix, userSettings, ... }:

{
  imports = [
              ../common/home.nix
              #stylix.homeManagerModules.stylix
              ../../user/shell/cli-collection.nix # Useful CLI apps
              #../../user/app/doom-emacs/doom.nix # My doom emacs config
              #../../user/style/stylix.nix # Styling and themes for my apps
              #../../user/lang/cc/cc.nix # C and C++ tools
            ];

  home.packages = with pkgs; [
    # Core
    #syncthing

    # Office
    #libreoffice-fresh

    # Various dev packages
    #texinfo
    #libffi zlib
    #nodePackages.ungit
  ];

  #services.syncthing.enable = true;

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    #music = "${config.home.homeDirectory}/Media/Music";
    #videos = "${config.home.homeDirectory}/Media/Videos";
    #pictures = "${config.home.homeDirectory}/Media/Pictures";
    #templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${userSettings.dotfilesDir}";
      #XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      #XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      #XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
    };
  };
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
  };

}
