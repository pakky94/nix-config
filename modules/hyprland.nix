{ lib, pkgs, ... }:
with lib;
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # portalPackage = pkgs.xdg-desktop-portal-wlr;
  };

  security.polkit.enable = true;

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    brillo
    clipse
    wl-clipboard

    hyprlock
    hyprshot

    kdePackages.qtwayland
    libsForQt5.qt5.qtwayland

    # blueman
    networkmanager
    networkmanagerapplet
    pavucontrol
    pipewire
    polkit

    notify-desktop
    swaynotificationcenter
    wireplumber
    waybar
    wofi
    xdg-desktop-portal-hyprland
    # xdg-desktop-portal-wlr
  ];

  pakky.programs.hyprland.enable = true;
}
