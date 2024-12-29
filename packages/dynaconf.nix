{
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:
buildPythonPackage rec {
  pname = "dynaconf";
  version = "3.2.6";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "dynaconf";
    hash = "sha256-dMwYlzljgLuVdzDrNBzAl27pw4u8tT0zB8UMrtCu37g=";
  };

  build-system = [ setuptools ];

  doCheck = false;
}
