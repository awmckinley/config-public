{ buildGoModule, fetchFromGitHub }:
buildGoModule rec {
  pname = "mult";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "dhth";
    repo = "mult";
    rev = "v${version}";
    hash = "sha256-PPHecG7fQb2A3igZGXenO9xsvcbRDgqmTgQpTJ2SS2c=";
  };

  vendorHash = "sha256-p0w7T7z5Cu1C0aYi5ZkCXouhEz/3kXPh4H23YJ2Bs4Y=";
}
