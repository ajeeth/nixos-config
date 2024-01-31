{ config, pkgs, lib, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      # google-fonts
      alegreya
      alice
      amiri
      caladea
      cantarell-fonts
      carlito
      comfortaa
      fira
      fira-code
      font-awesome
      hackgen-font
      ibm-plex
      inter
      iosevka
      jetbrains-mono
      lato
      liberation-sans-narrow
      liberation_ttf
      libertinus
      material-icons
      mona-sans
      montserrat
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      overpass
      pecita
      recursive
      source-code-pro
      source-sans
      source-sans-pro
      source-serif
      source-serif-pro
    ];
    fontconfig = {
      defaultFonts = {
        monospace = ["Noto Sans Mono" "Source Code Pro"];
        serif = ["Noto Serif" "Source Serif Pro"];
        sansSerif = ["Noto Sans" "Source Sans Pro"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
