{ pkgs, ... }:
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
    keepassxc
  ];

  imports = [
    ../../home-manager/modules
    ../../home-manager/scripts
  ];

  config.programs.firefox.enable = true;

  config.dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      mru-sources = "[('xkb', 'us'), ('xkb', 'us+alt-intl'), ('ibus', 'anthy')]";
      sources = "[('xkb', 'us'), ('ibus', 'anthy')]";
      xkb-options = "['terminate:ctrl_alt_bksp', 'compose:ralt', 'lv3:menu_switch']";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
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
