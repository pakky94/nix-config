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
    ./wezterm
    ./zellij
    ./zsh
  ];
}
