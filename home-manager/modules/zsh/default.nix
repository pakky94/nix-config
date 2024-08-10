{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.pakky;
in
{
  config = mkIf cfg.programs.zsh.enable {
    programs.zsh = {
      enable = true;

      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;

      dotDir = ".config/zsh";
      sessionVariables = { ZDOTDIR = "/home/${cfg.home-manager.username}/.config/zsh"; };

      shellAliases = rec {
        lg = "lazygit";
      };
    };

    programs.bat = {
      enable = true;
      config = { theme = "base16"; };
    };

    programs.dircolors = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.eza = {
      enable = true;
    };

    programs.zoxide = {
      enable = true;
    };

    # users.users.${cfg.home-manager.username}.shell = mkIf cfg.programs.zsh.default pkgs.zsh ;

    # users.users.${cfg.home-manager.username}.shell = pkgs.zsh;

    # if cfg.zsh.default then {
    #   users.users.${cfg.home-manager.username}.shell = pkgs.zsh;
    # };

  };
}
