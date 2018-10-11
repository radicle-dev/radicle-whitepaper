with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "radicle-whitepaper";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    texlive.combined.scheme-full
  ];
}
