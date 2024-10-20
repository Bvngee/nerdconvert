{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils"; # easy system enumeration
  };

  outputs = { nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells = {
        default = pkgs.mkShell {
          name = "nerdconvert";
          packages = with pkgs; [
            fontforge
            python3
          ];
          shellHook = ''
            source .venv/bin/activate
          '';
        };
      };
    });
}
