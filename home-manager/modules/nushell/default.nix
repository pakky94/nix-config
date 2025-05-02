{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.pakky;
in
{
  config = mkIf cfg.programs.nushell.enable {
    programs.nushell = {
      enable = true;

      shellAliases = {
        lg = "lazygit";
      };
    };
  };
}
