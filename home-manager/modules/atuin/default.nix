{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.pakky;
in
{
  config = mkIf cfg.programs.atuin.enable {
    programs.atuin = {
      enable = true;
    };
  };
}
