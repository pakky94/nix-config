{ config, lib, ... }:
with lib;
let
  configDir = "${config.pakky.nixConfigDir}/home-manager/configs";
in
{
  config = mkIf config.pakky.programs.hyprland.enable {
    xdg.configFile."hypr/hyprland.conf".source =
      config.lib.file.mkOutOfStoreSymlink "${configDir}/hypr/hyprland.conf";

    xdg.configFile."hypr/hyprlock.conf".source =
      config.lib.file.mkOutOfStoreSymlink "${configDir}/hypr/hyprlock.conf";

    xdg.configFile."waybar/config".source =
      config.lib.file.mkOutOfStoreSymlink "${configDir}/waybar/config";

    xdg.configFile."waybar/power_menu.xml".source =
      config.lib.file.mkOutOfStoreSymlink "${configDir}/waybar/power_menu.xml";
  };
}
