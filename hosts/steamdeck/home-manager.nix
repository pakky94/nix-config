{ lib, pkgs, ... }:
{
  config.home.username = "pakky";
  config.home.homeDirectory = "/home/pakky";
  config.home.stateVersion = "24.05";

  config.home.packages = with pkgs; [
    atac
    cargo
    cmake
    elixir
    entr
    gcc
    go
    keepassxc

    chromium
    obs-studio
    stremio

    unzip
    vlc
  ];

  imports = [
    ../../home-manager/modules
    ../../home-manager/scripts
  ];

  config.programs.firefox.enable = true;

  config.dconf.settings = with lib.hm.gvariant; {
    "org/gnome/desktop/input-sources" = {
      sources = [
        (mkTuple [ "xkb" "us" ])
        (mkTuple [ "ibus" "anthy" ])
      ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "compose:ralt" ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };
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

      kitty.enable = true;
      nvim.enable = true;
      starship.enable = true;
      wezterm.enable = true;
      zellij.enable = true;

      zsh = {
        default = true;
        enable = true;
      };
    };
  };
}
