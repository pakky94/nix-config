{ lib, pkgs, config, ... }:
{
  config = {
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

        userEmail = "marco@pacchialat.com";
        userName = "Marco Pacchialat";
      };
    };

    home.packages = [ pkgs.pre-commit ];
  };
}
