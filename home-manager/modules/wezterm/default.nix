{ lib, pkgs, config, ... }:
with lib;
{
  config = mkIf config.pakky.programs.wezterm.enable {

    programs.wezterm = {
      enable = true;
      extraConfig = ''
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.front_end = 'WebGpu'

config.color_scheme = 'Night Owl (Gogh)'
config.font = wezterm.font('CaskaydiaCove NF')
config.initial_cols = 150
config.initial_rows = 40
config.font_size = 10

local launch_menu = {}

config.launch_menu = launch_menu
config.adjust_window_size_when_changing_font_size = false
config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"

config.disable_default_key_bindings = true
local act = wezterm.action
config.keys = {
  { key = '[', mods = 'SUPER|CTRL',     action = act.ActivateTabRelative(-1), },
  { key = ']', mods = 'SUPER|CTRL',     action = act.ActivateTabRelative(1), },
  { key = '-', mods = 'SUPER|CTRL',     action = act.DecreaseFontSize, },
  { key = '=', mods = 'SUPER|CTRL',     action = act.IncreaseFontSize, },
  { key = '=', mods = 'SUPER|ALT|CTRL', action = act.ResetFontSize, },
  { key = 'C', mods = 'SHIFT|CTRL',     action = act.CopyTo 'Clipboard' },
  { key = 'V', mods = 'SHIFT|CTRL',     action = act.PasteFrom 'Clipboard' },
}

return config
      '';
    };
  };
}
