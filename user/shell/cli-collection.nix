{ pkgs, ... }:

{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    disfetch neofetch lolcat cowsay onefetch starfetch
    cava
    gnugrep gnused
    killall
    libnotify
    timer
    bat eza fd bottom ripgrep
    rsync
    tmux
    htop
    hwinfo
    unzip
    brightnessctl
    w3m
    fzf
    pandoc
    pciutils
    #(pkgs.callPackage ../pkgs/ytsub.nix { })
    #(pkgs.callPackage ../pkgs/russ.nix { })
    #(pkgs.python3Packages.callPackage ../pkgs/impressive.nix { })
    #(pkgs.callPackage ../pkgs/pokemon-colorscripts.nix { })
    vim neovim
  ];

  imports = [
    ../bin/phoenix.nix # My nix command wrapper
    ../bin/ytsub-wrappers.nix # My ytsub wrapper
  ];
}
