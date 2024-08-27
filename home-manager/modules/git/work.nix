{ lib, pkgs, config, ... }:
with lib;
let cfg = config.pakky.programs.git; in
{
  config = mkIf (cfg.enable && cfg.profile == "work") {
    programs = {
      git = {
        userEmail = "marco.pacchialat@euris.it";
        userName = "Marco Pacchialat";
        extraConfig = {
          credential.helper = "store --file ~/.git-credentials";
          url = {
            "https://tfshub.crifnet.com:8443/CRIF/ESG/_git/".insteadOf = "tfs:";
          };
        };
      };
    };
  };
}
