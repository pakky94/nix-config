{ lib, pkgs, config, ... }:
{
  imports = [
    ./atuin
    ./git
    ./nvim
    ./starship
    ./zellij
    ./zsh
  ];
}
