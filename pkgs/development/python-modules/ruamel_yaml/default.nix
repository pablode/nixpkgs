{ stdenv
, buildPythonPackage
, fetchPypi
, ruamel_base
, typing
, ruamel_ordereddict
, isPy3k
}:

buildPythonPackage rec {
  pname = "ruamel.yaml";
  version = "0.15.80";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1rhlshff9csjwn64x11b9a7gbxccs1vd7rdiqwlhifjxax8k682g";
  };

  # Tests cannot load the module to test
  doCheck = false;

  propagatedBuildInputs = [ ruamel_base typing ]
    ++ stdenv.lib.optional (!isPy3k) ruamel_ordereddict;

  meta = with stdenv.lib; {
    description = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order";
    homepage = https://bitbucket.org/ruamel/yaml;
    license = licenses.mit;
  };

}
