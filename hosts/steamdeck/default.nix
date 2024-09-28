{ lib, pkgs, ... }:
let
  myUsername = "pakky";
  myUserdescription = "Marco Pacchialat";
in {
  imports = [
    ./hardware-configuration.nix
    ./hyprland.nix
  ];

  nixpkgs.config.allowUnfree = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  jovian = {
    steam.enable = true;
    devices.steamdeck = {
      enable = true;
    };
  };

  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      (nerdfonts.override { fonts = [ "CascadiaCode" "CascadiaMono" "FiraCode" ]; })
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
    fontDir.enable = true;
    fontconfig.enable = true;
  };

  # allow steam to load fonts
  system.userActivationScripts.linktosharedfolder.text = ''
if [[ ! -h "$HOME/.local/share/fonts" ]]; then
  ln -s "/run/current-system/sw/share/X11/fonts" "$HOME/.local/share/fonts"
fi
  '';

  services.xserver.enable = true;


  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
    settings = {
      Wayland.CompositorCommand = lib.strings.concatStringsSep " " [
        "${lib.getBin pkgs.kdePackages.kwin}/bin/kwin_wayland"
          "--no-global-shortcuts"
          "--no-kactivities"
          "--no-lockscreen"
          "--locale1"
          "--inputmethod maliit-keyboard"
      ];
    };
  };

  services.xserver.desktopManager.gnome.enable = true;

  # services.desktopManager.plasma6.enable = true;
  # programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  services.syncthing = {
    enable = true;
    user = "${myUsername}";
    dataDir = "/home/${myUsername}/Sync";    # Default folder for new synced folders
    configDir = "/home/${myUsername}/Sync/.config/syncthing";   # Folder for Syncthing's settings and keys
  };

  programs = {
    zsh.enable = true;
  };

  # Create user
  users.users."${myUsername}" = {
    isNormalUser = true;
    description = myUserdescription;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      qbittorrent
    ];
  };

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ anthy ];
  };

  environment.systemPackages = with pkgs; [
    dconf-editor
    git
    gnomeExtensions.dock-from-dash
    gnome-terminal
    gnome-tweaks
    jupiter-dock-updater-bin
    maliit-keyboard
    neovim
    onboard
    steamdeck-firmware
  ];

  services.xserver.xkb.layout = "us";
  time.timeZone = "Europe/Rome";

  system.stateVersion = "24.05";
}
