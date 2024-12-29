{ config, pkgs, userSettings, systemSettings, agenix, ... }:

{
  imports = [
              ../common/home.nix
              ../../user/shell/cli-collection.nix # Useful CLI apps
              ../../user/lang/cc/cc.nix # C and C++ tools
              ../../user/app/ssh/ssh.nix 
            ];

  # Use agenix to securly deploy ssh config file
  age.identityPaths = [ "${config.home.homeDirectory}/.ssh/${systemSettings.profile}_${userSettings.username}-id_ed25519" ];
  age.secrets.ssh_config = {
    file = ../../secrets/ssh_config.age;
    path = "${config.home.homeDirectory}/.ssh/config";
  };

}
