{ lib, pkgs, config, ... }:
with lib;
let cfg = config.pakky.programs.kubernetes; in
{
  config.home.packages = [ 
    pkgs.k9s
    pkgs.stern
  ];
}
