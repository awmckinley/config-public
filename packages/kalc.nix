{
  fetchCrate,
  m4,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "kalc";
  version = "1.3.2";

  src = fetchCrate {
    inherit version;
    pname = "kalc";
    hash = "sha256-83/K+rrR6Wk3Z9/IXl2QLrXWBChVtwT0phMogOuyVsY=";
  };

  cargoHash = "sha256-bAjlgYIJ7wyz8R6OGrTxHj+pP/3GCpkB90A3kX3vTuQ=";

  nativeBuildInputs = [ m4 ];
}
