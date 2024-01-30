{ pkgs, ... }:
{
  programs.vim.extraConfig = ''
    set mouse-=a
  '';
}
