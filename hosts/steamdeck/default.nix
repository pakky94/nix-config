{ config, pkgs, lib, ... }:
let
  myUsername = "pakky";
  myUserdescription = "Marco Pacchialat";

  # TODO: this should be safe to remove
  # Fetch the "development" branch of the Jovian-NixOS repository
  # jovian-nixos = builtins.fetchGit {
  #   url = "https://github.com/Jovian-Experiments/Jovian-NixOS";
  #   ref = "development";
  # };
in {
  imports = [
    ./hardware-configuration.nix
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

  services.xserver.enable = true;

  # services.xserver.displayManager.gdm.wayland = true;

  services.xserver.displayManager.lightdm = {
    enable = true;
    greeter.enable = true;
    greeters.slick = {
      enable = true;
      extraConfig = ''
[greeter]
keyboard=onboard
      '';
    };
  };

  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  # services.displayManager.sddm.settings = {
  #   General.InputMethod = "maliit-keyboard";
  # };

  # TODO: check this
  # services.xserver.displayManager.gdm.wayland = lib.mkForce true; # lib.mkForce is only required on my setup because I'm using some other NixOS configs that conflict with this value
  # services.xserver.displayManager.defaultSession = "steam-wayland";
  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = myUsername;

  # Enable GNOME
  # sound.enable = true; TODO: remove

  services.xserver.desktopManager.gnome = {
    enable = true;
#     extraGSettingsOverrides = ''
# [org.gnome.desktop.a11y.applications]
# screen-keyboard-enabled=true
#     '';
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
  };

  # TODO: check this, what does it do?
  /*
  systemd.services.gamescope-switcher = {
    wantedBy = [ "graphical.target" ];
    serviceConfig = {
      User = 1000;
      PAMName = "login";
      WorkingDirectory = "~";

      TTYPath = "/dev/tty7";
      TTYReset = "yes";
      TTYVHangup = "yes";
      TTYVTDisallocate = "yes";

      StandardInput = "tty-fail";
      StandardOutput = "journal";
      StandardError = "journal";

      UtmpIdentifier = "tty7";
      UtmpMode = "user";

      Restart = "always";
    };

    script = ''
      set-session () {
        mkdir -p ~/.local/state
        >~/.local/state/steamos-session-select echo "$1"
      }
      consume-session () {
        if [[ -e ~/.local/state/steamos-session-select ]]; then
          cat ~/.local/state/steamos-session-select
          rm ~/.local/state/steamos-session-select
        else
          echo "gamescope"
        fi
      }
      while :; do
        session=$(consume-session)
        case "$session" in
          plasma)
            dbus-run-session -- gnome-shell --display-server --wayland
            ;;
          gamescope)
            steam-session
            ;;
        esac
      done
    '';
  };
  */

  environment.systemPackages = with pkgs; [
    dconf-editor
    git
    gnome-terminal
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
