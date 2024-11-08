{
  lib,
  authlib,
  buildPythonPackage,
  fetchFromGitHub,
  grpcio,
  grpcio-health-checking,
  grpcio-tools,
  httpx,
  pydantic,
  pythonOlder,
  requests,
  setuptools-scm,
  validators,
}:

buildPythonPackage rec {
  pname = "weaviate-client";
  version = "4.8.1";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "weaviate";
    repo = "weaviate-python-client";
    rev = "refs/tags/v${version}";
    hash = "sha256-HSLU9OQMEOCwgxtLj20yJ0Xo9c6SVfMhfVT/F5du17A=";
  };

  pythonRelaxDeps = [
    "httpx"
    "validators"
  ];

  build-system = [ setuptools-scm ];


  dependencies = [
    authlib
    grpcio
    grpcio-health-checking
    grpcio-tools
    httpx
    pydantic
    requests
    validators
  ];

  doCheck = false;

  pythonImportsCheck = [ "weaviate" ];

  meta = with lib; {
    description = "Python native client for easy interaction with a Weaviate instance";
    homepage = "https://github.com/weaviate/weaviate-python-client";
    changelog = "https://github.com/weaviate/weaviate-python-client/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ happysalada ];
  };
}
