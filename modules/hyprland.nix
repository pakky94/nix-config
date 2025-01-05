{ lib, pkgs, inputs, ... }:
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
    rofi
    swaynotificationcenter
    waybar
    wireplumber
    wlogout
    xdg-desktop-portal-hyprland
    inputs.hyprland-qtutils.packages."${pkgs.system}".default
    # xdg-desktop-portal-wlr

    inputs.zen-browser.packages."${pkgs.system}".default
  ];

  pakky.programs.hyprland.enable = true;
}
