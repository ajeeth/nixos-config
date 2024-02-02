  { pkgs, config, ... }: 
{
  home.file."${config.xdg.configHome}/katerc".source = ./katerc;
}