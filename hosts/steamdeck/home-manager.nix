{ config, pkgs, lib, home-manager, ... }:
{
  config.home-manager.users."pakky" = {
    home.username = "pakky";
    home.homeDirectory = "/home/pakky";
    home.stateVersion = "24.05";

    home.packages = with pkgs; [
      atac
      cargo
      cmake
      entr
      gcc
      go
    ];

    imports = [
      ../../home-manager/modules
      ../../home-manager/scripts
    ];
  };

  config.pakky = {
    home-manager.username = "pakky";
    programs = {
      atuin.enable = true;

      git = {
        enable = true;
        profile = "personal";
      };

      nvim.enable = true;
      starship.enable = true;
      zellij.enable = true;

      zsh = {
        default = true;
        enable = true;
      };
    };
  };

  # imports = [
  #   ../../home-manager/modules
  #   ../../home-manager/scripts
  # ];
}
