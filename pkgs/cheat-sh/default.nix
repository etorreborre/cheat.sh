# Replace "stdenv" with the namespace or name of your language's builder
{ self,
  stdenv,
  lib,
  fetchurl,
}:

stdenv.mkDerivation rec {
  pname = "cheat-sh";
  version = "1.0.0";
  MACOSX_DEPLOYMENT_TARGET = true;

  sourceRoot = ".";

  src = fetchurl {
    url = "https://cht.sh/:cht.sh";
    sha256 = "sha256-92ORC10l4+UqjcCj+kc5MBQo2sn9qFFeM8HrsMYsFGo=";
    executable = true;
  };

  phases = [ "installPhase" ];

  installPhase = ''
    install -m755 -D $src $out/bin/ch.sh
  '';

  meta = with lib; {
    homepage = "https://github.com/chubin/cheat.sh";
    description = "cheat.sh executable";
    platforms = platforms.darwin;
    architectures = [ "x86" "aarch64" ];
  };

}
