{
  description = "Minimal markup language";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs { inherit system; };
      in
        with pkgs; {
          defaultPackage = stdenv.mkDerivation {
            meta = with pkgs.lib; {
              description = "Minimal markup language";
            };

            pname = "mnml";
            version = "git";

            nativeBuildInputs = [
              go
              autoPatchelfHook
            ];

            doCheck = true;

            src = ./.;

            buildPhase = ''
              export HOME=$(pwd); # Fix trying to write to /homeless-shelter
              make;
            '';

            installPhase = ''
              mkdir -p $out/bin

              cp mnmapget/mnmapget     $out/bin/mnmapget
              cp mnmlstget/mnmlstget   $out/bin/mnmlstget
              cp mnmlstnsrt/mnmlstnsrt $out/bin/mnmlstnsrt
              cp mnmlid/mnmlid 			 	 $out/bin/mnmlid
              cp mnmlgetpth 			 		 $out/bin/mnmlgetpth
              cp mnmapkeys 			 		   $out/bin/mnmapkeys
            '';
          };
        }
    );
}
