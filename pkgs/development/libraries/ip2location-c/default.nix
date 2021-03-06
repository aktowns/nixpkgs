{ stdenv, fetchurl, autoreconfHook }:

let version = "7.0.2"; in # meta.homepage might change after a major update
stdenv.mkDerivation {
  name = "ip2location-c-${version}";

  src = fetchurl {
    sha256 = "1gs43qgcyfn83abrkhvvw1s67d1sbkbj3hab9m17ysn6swafiycx";
    url = "http://www.ip2location.com/downloads/ip2location-c-${version}.tar.gz";
  };

  nativeBuildInputs = [ autoreconfHook ];

  enableParallelBuilding = true;

  # Checks require a database, which require registration (although sample
  # databases are available, downloading them for just 1 test seems excessive):
  doCheck = false;

  meta = with stdenv.lib; {
    inherit version;
    description = "Library to look up locations of host names and IP addresses";
    longDescription = ''
      A C library to find the country, region, city,coordinates,
      zip code, time zone, ISP, domain name, connection type, area code,
      weather, MCC, MNC, mobile brand name, elevation and usage type of
      any IP address or host name in the IP2Location databases.
    '';
    homepage = http://www.ip2location.com/developers/c-7;
    license = with licenses; [ gpl3Plus lgpl3Plus ];
    platforms = platforms.linux;
    maintainers = with maintainers; [ nckx ];
  };
}
