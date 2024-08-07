{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.pakky;
in
{
  config = mkIf cfg.programs.starship.enable {
    programs.starship = {
      enable = true;
    };
  };
}
