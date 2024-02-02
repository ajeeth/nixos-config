{ pkgs, ... }: 
{
  home.file.".ssh/authorized_keys".text = ''
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIRoiVQZAWzai1hVhjpx2g9Xvbe6jh3h55PxQsB7VlKK ajeeth.samuel@gmail.com
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFURJoAvAEzCMSnWk1H5mx1H3ySzXpOwBuI1O54ulP/+t/yHU7vNk571UOOxGzxvPmFRD2y8KLje7NzEwRFEYBC+HGF1YtDyz5EDni1pakiEPsAaHBSpqUmi1b0oCss/B5x6Bikw4AeQZ5SVLaBRIoCS+oDT3sln82cuNZGCfAA4AQzch+GuvUISA68mAR2ru/fJoppWHMrkrR3Dw0CcHuLfLGKDfhuxPA3DcOvDh8e9jeWYm0uO+DZFimOPh41p/SeEA1+wEbsxdL3NGCS2+qj52jHGbg1TCzmIFitbUFpklk8kscELZi67W7AZYjSRzXWgs8PVJcHlUX9Wbueuxp job@AGH00099
  '';
}
