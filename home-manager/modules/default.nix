{ lib, pkgs, config, ... }:
{
  config.programs.ripgrep.enable = true;

  config.services.ssh-agent.enable = true;

  imports = [
    ./atuin
    ./git
    ./kubernetes
    ./nvim
    ./starship
    ./zellij
    ./zsh
  ];
}
