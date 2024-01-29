{ config, pkgs, userSettings, ... }:

{
  imports = [ ../work/home.nix # Personal is essentially work system + games
              ../../user/app/games/games.nix # Various videogame apps
            ];

  home.packages = with pkgs; [
    # Media
    tuxpaint
  ];

  xdg.enable = true;
  xdg.userDirs = {
    extraConfig = {
      XDG_GAME_DIR = "${config.home.homeDirectory}/Media/Games";
      XDG_GAME_SAVE_DIR = "${config.home.homeDirectory}/Media/Game Saves";
    };
  };

}
