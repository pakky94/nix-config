{ lib, pkgs, config, ... }:
with lib;
let
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

    programs.neovim = {
      enable = true;
      package = pkgs.neovim-unwrapped;

      defaultEditor = true;

      withPython3 = true;
    };
  };
}

# nix xdg.configFile = { nvim = { source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/config/nvim"; recursive = true; }; };
