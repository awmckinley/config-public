{
  alembic,
  buildPythonPackage,
  dynaconf,
  fetchPypi,
  importlib-metadata,
  mediafile,
  musicbrainzngs,
  pluggy,
  poetry-core,
  pythonRelaxDepsHook,
  questionary,
  rich,
  sqlalchemy,
  unidecode,
}:
buildPythonPackage rec {
  pname = "moe";
  version = "2.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "moe";
    hash = "sha256-TpZlEasu+5VnOELHHkom/H07bxGcwA67zjxEMUAKw9M=";
  };

  dependencies = [
    alembic
    dynaconf
    importlib-metadata
    mediafile
    musicbrainzngs
    pluggy
    questionary
    rich
    sqlalchemy
    unidecode
  ];

  build-system = [ pythonRelaxDepsHook ];

  nativeBuildInputs = [ poetry-core ];

  pythonRelaxDeps = [ "mediafile" ];

  doCheck = false;
}
