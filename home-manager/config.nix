{ config, pkgs, lib, flake-self, home-manager, ... }:
with lib;
{
  options.pakky.home-manager = {
    username = mkOption {
      type = types.str;
      default = "pakky";
      description = "Main user";
      example = "marco";
    };
  };
}
