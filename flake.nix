{
  description = "Better than corn flakes";

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, stylix,
              blocklist-hosts, hyprland-plugins, plasma-manager, agenix, ... }@inputs:
  let
    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hostname = "naradan"; # hostname
      profile = "vbox"; # select a profile defined from profiles directory
      timezone = "Asia/Dubai"; # select timezone
      locale = "en_US.UTF-8"; # select locale
    };

    # ----- USER SETTINGS ----- #
    userSettings = rec {
      username = "ajeeth"; # username
      name = "Ajeeth"; # name/identifier
      email = "ajeeth.samuel@gmail.com"; # email (used for certain configurations)
      dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
      theme = "uwunicorn"; # selcted theme from my themes directory (./themes/)
      wm = "kde"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
      # window manager type (hyprland or x11) translator
      wmType = if (wm == "hyprland") then "wayland" else "x11";
      browser = "firefox"; # Default browser; must select one from ./user/app/browser/
      term = "alacritty"; # Default terminal command;
      font = "Intel One Mono"; # Selected font
      fontPkg = pkgs.intel-one-mono; # Font package
      editor = "vim"; # Default editor;
      # editor spawning translator
      # generates a command that can be used to spawn editor inside a gui
      # EDITOR and TERM session variables must be set in home.nix or other module
      # I set the session variable SPAWNEDITOR to this in my home.nix for convenience
      spawnEditor = if (editor == "emacsclient") then "emacsclient -c -a 'emacs'"
                    else (if ((editor == "vim") || (editor == "nvim") || (editor == "nano")) then "exec " + term + " -e " + editor else editor);
    };


    ### create patched nixpkgs
    ##nixpkgs-patched = (import nixpkgs { system = systemSettings.system; }).applyPatches {
    ##  name = "nixpkgs-patched";
    ##  src = nixpkgs;
    ##  patches = [
    ##              ./patches/nixos-nixpkgs-268027.patch
    ##            ];
    ##};

    # configure pkgs
    pkgs = import nixpkgs {
      system = systemSettings.system;
      config = { allowUnfree = true;
                 allowUnfreePredicate = (_: true); };
    };

    pkgs-stable = import nixpkgs-stable {
      system = systemSettings.system;
      config = { allowUnfree = true;
                 allowUnfreePredicate = (_: true); };
    };

    # configure lib
    lib = nixpkgs.lib;

  in {
    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ (./. + "/profiles"+("/"+systemSettings.profile)+"/home.nix") # load home.nix from selected PROFILE
                    # inputs.nix-flatpak.homeManagerModules.nix-flatpak # Declarative flatpaks
                      inputs.plasma-manager.homeManagerModules.plasma-manager
                      inputs.agenix.homeManagerModules.age
                    ];

          extraSpecialArgs = {
            # pass config variables from above
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            #inherit (inputs) nix-flatpak;
            inherit (inputs) agenix;
            inherit (inputs) stylix;
            inherit (inputs) hyprland-plugins;
          };
      };
    };
    nixosConfigurations = {
      system = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ 
          (./. + "/profiles"+("/"+systemSettings.profile)+"/configuration.nix")  # load configuration.nix from selected PROFILE
          agenix.nixosModules.age
        ];
        specialArgs = {
          # pass config variables from above
          inherit systemSettings;
          inherit userSettings;
          inherit (inputs) agenix;
          inherit (inputs) stylix;
          inherit (inputs) blocklist-hosts;
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };

    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      flake = false;
    };
      
    plasma-manager = {                                                    # KDE Plasma User Settings Generator
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
}
