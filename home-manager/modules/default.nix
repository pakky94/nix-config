{ lib, pkgs, config, ... }:
{
  config.programs.ripgrep.enable = true;

  config.services.ssh-agent.enable = true;

  imports = [
    ./atuin
    ./git
    ./kitty
    ./kubernetes
    ./nvim
    ./starship
    ./tmux
    ./wezterm
    ./zellij
    ./zsh
  ];

  config.xdg.configFile."ideavim/ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "${config.pakky.nixConfigDir}/home-manager/configs/ideavimrc";
}
