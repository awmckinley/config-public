{
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:
{ }
// lib.optionalAttrs isDarwin {
  homebrew.taps = [ "isen-ng/dotnet-sdk-versions" ];
  homebrew.casks = [
    # .NET SDK
    "dotnet"
    "isen-ng/dotnet-sdk-versions/dotnet-sdk9-0-100"
  ];
}
// lib.optionalAttrs isLinux {
  environment.systemPackages = with pkgs; [
    # Roslyn-based LSP language server
    # replaces: omnisharp-roslyn
    csharp-ls

    # opinionated code formatter for C#
    csharpier

    # .NET SDK
    (dotnetCorePackages.combinePackages [
      dotnetCorePackages.sdk_6_0
      dotnetCorePackages.sdk_7_0
      dotnetCorePackages.sdk_8_0
      dotnetCorePackages.sdk_9_0
    ])

    # generates an API client to call any OpenAPI
    kiota
  ];

  nixpkgs.overlays = [
    (final: prev: {
      csharpier = final.callPackage ../packages/csharpier.nix { };
      kiota = final.callPackage ../packages/kiota.nix { };
    })
  ];
}
