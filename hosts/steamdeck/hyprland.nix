{ lib, pkgs, ... }:
with lib;
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # portalPackage = pkgs.xdg-desktop-portal-wlr;
  };

  environment.systemPackages = with pkgs; [
    brillo

    # anthy
    # fcitx5
    # fcitx5-anthy
    # fcitx5-mozc
    # fcitx5-configtool

    networkmanager
    networkmanagerapplet
    pavucontrol
    pipewire
    wireplumber
    waybar
    wofi
    xdg-desktop-portal-hyprland
    # xdg-desktop-portal-wlr
  ];

/*
  xdg.configFile."waybar/config".text = ''
'';
*/

/*
  xdg.configFile."hypr/hyprland.conf".text = ''
'';
*/
}
