{ lib, pkgs, ... }:
with lib;
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # portalPackage = pkgs.xdg-desktop-portal-wlr;
  };

  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    brillo

    hyprlock

    # anthy
    # fcitx5
    # fcitx5-anthy
    # fcitx5-mozc
    # fcitx5-configtool
    kdePackages.qtwayland
    libsForQt5.qt5.qtwayland

    networkmanager
    networkmanagerapplet
    pavucontrol
    pipewire
    polkit

    swaynotificationcenter
    wireplumber
    waybar
    wofi
    xdg-desktop-portal-hyprland
    # xdg-desktop-portal-wlr
  ];

  pakky.programs.hyprland.enable = true;

/*
  xdg.configFile."waybar/config".text = ''
'';
*/

/*
  xdg.configFile."hypr/hyprland.conf".text = ''
'';
*/
}
