{ pkgs, ... }:
let
  dotnetPkg =
    (with pkgs.dotnetCorePackages; combinePackages [
     sdk_8_0
     sdk_9_0
    ]);
in
{
  config.home.packages = with pkgs; [
    atac
    cargo
    cmake
    elixir
    entr
    gcc
    go

    jaq
    jq
    gnumake
    ruby

    jetbrains-toolbox
    dotnetPkg
  ];

  config.home.sessionVariables = {
    DOTNET_ROOT = "${dotnetPkg}";
  };
}
