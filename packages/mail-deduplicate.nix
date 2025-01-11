{
  arrow,
  boltons,
  buildPythonPackage,
  click-extra,
  fetchPypi,
  pythonRelaxDepsHook,
  setuptools,
  tabulate,
}:
buildPythonPackage rec {
  pname = "mail-deduplicate";
  version = "7.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "mail_deduplicate";
    hash = "sha256-5qk9ftcLQXbkJ8FckLc1YZJ12Oyme+WZUzn3uAdutIw=";
  };

  dependencies = [
    arrow
    boltons
    click-extra
    tabulate
  ];

  build-system = [
    pythonRelaxDepsHook
    setuptools
  ];

  pythonRelaxDeps = [ "arrow" ];

  doCheck = false;
}
