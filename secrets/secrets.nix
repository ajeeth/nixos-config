## to encrypt:
## nix run github:ryantm/agenix -- -e <file_name>.age
## to rekey after changes in pub assignment:
## nix run github:ryantm/agenix -- -r

let
  vbox = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIICsoupDojBVAqUddBI56KzRjzY/Ib4nRlC0nGpYpkh4 vbox@devnullmail.com";
  helios = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIImyPY+bzFoXntq2iQqLLHBaYreDH5RxJd9e9agTqQXu helios@devnullmail.com";
  job = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIRoiVQZAWzai1hVhjpx2g9Xvbe6jh3h55PxQsB7VlKK ajeeth.samuel@gmail.com";
in
{
  "algo_wg-fr.conf.age".publicKeys = [ vbox job ];
  "alpha.ovpn.age".publicKeys = [ job ];
  "ssh_config.age".publicKeys = [ helios job vbox ];
  "primenet.nmconnection.age".publicKeys = [ helios job ];
  "pixel.nmconnection.age".publicKeys = [ helios job ];
  "kwallet.xml.age".publicKeys = [ helios job ];
}