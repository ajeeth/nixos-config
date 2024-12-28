{ pkgs, ... }:

{
  imports = [ ./pipewire.nix
              ./dbus.nix
              ./fonts.nix
            ];

  # Configure X11
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    xkb. options = "caps:escape";
    excludePackages = [ pkgs.xterm ];
  };

  services.libinput.touchpad.disableWhileTyping = true;

  environment = {
    systemPackages = with pkgs; [
      clinfo
      glxinfo
      wayland-utils
    ];
  };
}
