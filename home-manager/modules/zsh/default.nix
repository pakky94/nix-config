{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.pakky;
in
{
  options.pakky.programs.zsh.default = mkEnableOption "Use zsh as default shell";
  options.pakky.programs.zsh.enable = mkEnableOption "Setup zsh";

  config = mkIf cfg.programs.zsh.enable {
    programs.zsh = {
      enable = true;

      dotDir = ".config/zsh";
      sessionVariables = { ZDOTDIR = "/home/${cfg.home-manager.username}/.config/zsh"; };
    };

    programs.dircolors = {
      enable = true;
      enableZshIntegration = true;
    };

    # users.users.${cfg.home-manager.username}.shell = mkIf cfg.programs.zsh.default pkgs.zsh ;

    # users.users.${cfg.home-manager.username}.shell = pkgs.zsh;

    # if cfg.zsh.default then {
    #   users.users.${cfg.home-manager.username}.shell = pkgs.zsh;
    # };

  };
}
