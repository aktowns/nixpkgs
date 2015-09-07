{ stdenv, fetchurl }:

let version = "7.0.0"; in
stdenv.mkDerivation {
  name = "ip2location-${version}";

  src = fetchurl {
    sha256 = "05zbc02z7vm19byafi05i1rnkxc6yrfkhnm30ly68zzyipkmzx1l";
    url = "http://www.ip2location.com/downloads/ip2location-${version}.tar.gz";
  };

  enableParallelBuilding = true;

  doCheck = true;

  meta = with stdenv.lib; {
    inherit version;
    description = "Look up locations of host names and IP addresses";
    longDescription = ''
      A command-line tool to find the country, region, city,coordinates,
      zip code, time zone, ISP, domain name, connection type, area code,
      weather, MCC, MNC, mobile brand name, elevation and usage type of
      any IP address or host name in the IP2Location databases.
    '';
    homepage = http://www.ip2location.com/free/applications;
    license = with licenses; [ gpl3Plus lgpl3Plus ];
    platforms = platforms.unix;
    maintainers = with maintainers; [ nckx ];
  };
}