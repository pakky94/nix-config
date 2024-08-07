{ lib, pkgs, config, ... }:
with lib;
{
  config = mkIf config.pakky.programs.zellij.enable {
    xdg = {
      enable = true;
      configFile = {
        zellij_config = {
          target = "zellij";
          source = ./config;
        };
      };
    };

    programs.zellij = {
      enable = true;
    };
  };
}
