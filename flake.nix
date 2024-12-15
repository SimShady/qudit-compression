{
  description = "qudit-compression";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell = pkgs.mkShell {
        nativeBuildInputs = [ pkgs.bashInteractive ];
        buildInputs = with pkgs; [
          (python311.withPackages (python-pkgs: with python-pkgs; [
            pip
            # matplotlib
            # pylatexenc
          ]))
        ];
        shellHook = with pkgs; ''
          pip install -r requirements.txt
        '';
      };
    });
}