{ pkgs, lib, stdenv }:

stdenv.mkDerivation {
  meta = with pkgs.lib; {
    description = "Minimal plain text data parsing tools";
  };

  pname = "mnml";
  version = "git";

  buildInputs = with pkgs; [
    #pkgconfig
    go
    #lua51Packages.lua
  ];

  buildPhase = ''
    export HOME=$(pwd)
  '';

  doCheck = true;

  src = ./.;

  installPhase = ''
    mkdir -p $out/bin

    cp mnmapget/mnmapget     $out/bin/mnmapget
    cp mnmlstget/mnmlstget   $out/bin/mnmlstget
    cp mnmlstnsrt/mnmlstnsrt $out/bin/mnmlstnsrt
    cp mnmlid/mnmlid 			 	 $out/bin/mnmlid
    cp mnmlgetpth 			 		 $out/bin/mnmlgetpth
    cp mnmapkeys 			 		   $out/bin/mnmapkeys
  '';
}
