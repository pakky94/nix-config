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
      sessionVariables = { 
        ZDOTDIR = "/home/${cfg.home-manager.username}/.config/zsh"; 
        # SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent.socket";
      };

#       initExtra = ''
# # SSH Agent should be running, once
# runcount=$(ps -ef | grep "ssh-agent" | grep -v "grep" | wc -l)
# if [ $runcount -eq 0 ]; then
#     echo Starting SSH Agent
#     eval $(ssh-agent -s -a $SSH_AUTH_SOCK)
# fi
#       '';

      shellAliases = rec {
        cat = "bat --pager=never";
        lg = "lazygit";
        nixdev = "nix develop -c $SHELL";
        zz = "z -";
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

    programs.direnv = {
      enable = true;
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
