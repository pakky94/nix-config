{ lib, pkgs, config, ... }:
with lib;
{
  imports = [
    ./personal.nix
  ];

  home.packages = with pkgs; mkIf config.pakky.programs.git.enable [
    (writeShellScriptBin "git-bare-clone" ''
set -e

git clone --bare $1 ./.bare
echo "gitdir: ./.bare" > .git
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
      '')
  ];
}
