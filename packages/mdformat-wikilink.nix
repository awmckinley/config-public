{
  buildPythonPackage,
  fetchFromGitHub,
  mdformat,
  poetry-core,
  pythonOlder,
}:
buildPythonPackage rec {
  pname = "mdformat-wikilink";
  version = "0.2.0";
  pyproject = true;

  disabled = pythonOlder "3.11";

  src = fetchFromGitHub {
    owner = "tmr232";
    repo = "mdformat-wikilink";
    rev = "refs/tags/v${version}";
    hash = "sha256-KOPh9iZfb3GCvslQeYBgqNaOyqtWi2llkaiWE7nmcJo=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [ mdformat ];

  pythonImportsCheck = [ "mdformat_wikilink" ];
}
