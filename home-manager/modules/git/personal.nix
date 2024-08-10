{ lib, pkgs, config, ... }:
with lib;
let cfg = config.pakky.programs.git; in
{
  config = mkIf (cfg.enable && cfg.profile == "personal") {
    programs = {
      git = {
        userEmail = "marco@pacchialat.com";
        userName = "Marco Pacchialat";
      };
    };

    home.packages = [ pkgs.pre-commit ];
  };
}
