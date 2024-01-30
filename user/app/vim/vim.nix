{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-airline ];
    settings = { ignorecase = true; };
    extraConfig = ''
      set mouse-=a
      filetype on
      filetype plugin on
      syntax enable
      set grepprg=grep\ -nH\ $*
      set smartcase
      set autoindent
      set expandtab
      set smarttab
      set shiftwidth=3
      set softtabstop=3
      set incsearch
      set hlsearch
      set showcmd
    '';
  };
}
