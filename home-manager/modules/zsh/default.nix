{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.pakky;
in
{
  config = mkIf cfg.programs.zsh.enable {
    programs.zsh = {
      enable = true;

      dotDir = ".config/zsh";
      sessionVariables = { ZDOTDIR = "/home/${cfg.home-manager.username}/.config/zsh"; };

      initExtra = ''
      ${if cfg.programs.atuin.enable then "eval ''\"$(atuin init zsh)''\"" else ""}
      '';

      shellAliases = rec {
        ls = "eza";
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
