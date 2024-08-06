{ lib, pkgs, config, ... }:
with lib;
{
  config = {
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
