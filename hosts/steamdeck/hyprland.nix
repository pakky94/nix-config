{ lib, pkgs, ... }:
with lib;
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

# xdg.configFile."hypr/hyprland.conf".text = ''
# '';

  environment.systemPackages = with pkgs; [
    wofi
  ];
}
