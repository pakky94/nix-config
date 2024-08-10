{ lib, pkgs, config, ... }:
{
  config.programs.ripgrep.enable = true;

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
