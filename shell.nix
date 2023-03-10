let
  unstable = import
    (fetchTarball "https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz")
    { };
in
{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
mkShell {
  name = "hello-gitops";

  buildInputs = with pkgs; [
    unstable.docker
    unstable.go_1_18
    unstable.go-task
    unstable.fluxcd
    unstable.kind
  ];

  GITHUB_USERNAME = "jordangarrison";
  KUBECONFIG = "/home/jordangarrison/dev/scale2023/hello-gitops/kubeconfig";
}
