{ pkgs, ... }: 
{
  programs.ssh.enable = true;
  programs.ssh.matchBlocks = {
    fooServer = {
      port = 1022;
      hostname =  "example.com";
      user = "me";
    };
  };
}
