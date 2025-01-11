{
  boltons,
  buildPythonPackage,
  click,
  cloup,
  commentjson,
  fetchPypi,
  mergedeep,
  poetry-core,
  pythonRelaxDepsHook,
  pyyaml,
  requests,
  tabulate,
  wcmatch,
  xmltodict,
}:
buildPythonPackage rec {
  pname = "click-extra";
  version = "4.8.3";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "click_extra";
    hash = "sha256-0KJAnRxlukDecxk79aWJ1KpuqRPNhbvM5yaJqIRLBgE=";
  };

  dependencies = [
    boltons
    click
    cloup
    commentjson
    mergedeep
    pyyaml
    requests
    tabulate
    wcmatch
    xmltodict
  ];

  build-system = [ pythonRelaxDepsHook ];

  nativeBuildInputs = [ poetry-core ];

  pythonRelaxDeps = [
    "regex"
    "wcmatch"
  ];

  doCheck = false;
}
