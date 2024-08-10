{ lib, pkgs, config, ... }:
with lib;
{
  imports = [
    ./personal.nix
    ./work.nix
  ];

  config = mkIf (config.pakky.programs.git.enable) {
    programs = {
      git = {
        enable = true;
        ignores = [
          "tags"
          "*.swp"
          # Nix builds
          "result"
          # Core latex/pdflatex auxiliary files
          "*.aux"
          "*.lof"
          "*.log"
          "*.lot"
          "*.fls"
          "*.out"
          "*.toc"
          "*.fmt"
          "*.fot"
          "*.cb"
          "*.cb2"
          ".*.lb"
          # Python
          "__pycache__/"
          "*.py[cod]"
          "*$py.class"
          ".Python"
          "build/"
          "develop-eggs/"
          "dist/"
        ];
      };

      lazygit = {
        enable = true;
      };
    };

    home.packages = with pkgs; mkIf config.pakky.programs.git.enable [
      pkgs.pre-commit

      (writeShellScriptBin "git-bare-clone" ''
set -e

git clone --bare $1 ./.bare
echo "gitdir: ./.bare" > .git
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
        '')
    ];
  };

}
