{
  darwin,
  fetchCrate,
  lib,
  rustPlatform,
  stdenv,
}:
rustPlatform.buildRustPackage rec {
  pname = "minicloze";
  version = "1.7.5";

  src = fetchCrate {
    inherit version;
    pname = "minicloze";
    hash = "sha256-nZtQYehl98uL8WGel4AGku5+HdURyAitmP2DzL1zH9A=";
  };

  cargoHash = "sha256-jytk8O2ozN70d1AVaSTInMK8IBLXznWY7d73O2py+I0=";

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.CoreServices
    darwin.apple_sdk.frameworks.SystemConfiguration
  ];
}
