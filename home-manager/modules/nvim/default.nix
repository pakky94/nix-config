{ lib, pkgs, config, ... }:
with lib;
let
  configDir = "${config.pakky.nixConfigDir}/home-manager/configs";
  cfg = config.pakky.programs.nvim;
in
{
  config = mkIf cfg.enable {
    xdg = {
      enable = true;
      configFile = {
        nvim_lua_config = {
          target = "nvim";
          source = ./lua-config;
          recursive = true;
        };
      };
    };
  /*
    xdg = {
      enable = true;
      configFile = {
        target = "nvim";
        source = config.lib.file.mkOutOfStoreSymlink "${configDir}/nvim";
      };
    };
  */

    programs.neovim = {
      enable = true;
      package = pkgs.neovim-unwrapped;

      defaultEditor = true;

      withPython3 = true;
    };
  };
}

# nix xdg.configFile = { nvim = { source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/config/nvim"; recursive = true; }; };
