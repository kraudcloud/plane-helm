{
  inputs = {
    utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    knixpkgs.url = "github:Karitham/knixpkgs";
  };
  outputs = {
    self,
    nixpkgs,
    knixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        kpkgs = knixpkgs.packages.${system};
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            kubernetes-helm
            helmfile
            kubectx
            kubectl
            k9s
            sops
            kind
            kpkgs.helm-readme-generator
          ];
        };
      }
    );
}
