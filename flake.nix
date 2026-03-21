{
  description = "wks language server";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        wksls = pkgs.writeShellApplication {
          name = "wksls";
          runtimeInputs = with pkgs; [ bash jq ];
          text = builtins.readFile ./wksls;
        };
      in
      {
        packages.default = wksls;

        devShells.default = pkgs.mkShell {
          name = "wksls";

          packages = with pkgs; [
            bash
            bats
            jq
            shellcheck
            wksls
          ];
        };
      });
}
