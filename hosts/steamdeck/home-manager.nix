{ config, pkgs, ... }:
{
  config.home.username = "pakky";
  config.home.homeDirectory = "/home/pakky";
  config.home.stateVersion = "24.05";

  config.home.packages = with pkgs; [
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

  config.programs.firefox.enable = true;

  config.dconf.settings = {
    "org/gnome/mutter" = {
      edge-tiling = true;
    };
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
}
