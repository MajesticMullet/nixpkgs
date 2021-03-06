{ stdenv
, pari
, fetchurl
, perl }:

stdenv.mkDerivation rec {
  pname = "gp2c";
  version = "0.0.11pl4";

  src = fetchurl {
    url = "https://pari.math.u-bordeaux.fr/pub/pari/GP2C/${pname}-${version}.tar.gz";
    sha256 = "sha256-QGocEXxTahB5fHhlWtHXgMEl6brQ34LNwScxHNuB1rI=";
  };

  buildInputs = [ pari perl ];

  configureFlags = [
    "--with-paricfg=${pari}/lib/pari/pari.cfg"
    "--with-perl=${perl}/bin/perl" ];

  meta = with stdenv.lib; {
    description =  "A compiler to translate GP scripts to PARI programs";
    homepage = "http://pari.math.u-bordeaux.fr/";
    downloadPage = "http://pari.math.u-bordeaux.fr/download.html";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ AndersonTorres ];
  };
}
