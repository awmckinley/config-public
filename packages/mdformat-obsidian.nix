{
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  mdformat,
  mdformat-gfm,
  mdit-py-plugins,
  pythonOlder,
  pythonRelaxDepsHook,
}:
buildPythonPackage rec {
  pname = "mdformat-obsidian";
  version = "0.1.0";
  pyproject = true;

  disabled = pythonOlder "3.11";

  src = fetchFromGitHub {
    owner = "KyleKing";
    repo = "mdformat-obsidian";
    rev = "refs/tags/v${version}";
    hash = "sha256-TMLZXyF/VLvF1TzBvqMP0bRx8YyY7bGZm5CJUUtrcpI=";
  };

  build-system = [ pythonRelaxDepsHook ];

  nativeBuildInputs = [ flit-core ];

  propagatedBuildInputs = [
    mdformat
    mdformat-gfm
    mdit-py-plugins
  ];

  pythonImportsCheck = [ "mdformat_obsidian" ];

  pythonRelaxDeps = [ "mdit-py-plugins" ];
}
