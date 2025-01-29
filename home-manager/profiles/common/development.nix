{ pkgs, ... }:
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

    jetbrains-toolbox
    (with dotnetCorePackages; combinePackages [
      sdk_8_0
      sdk_9_0
    ])
  ];

  config.programs.nushell.enable = true;
}
