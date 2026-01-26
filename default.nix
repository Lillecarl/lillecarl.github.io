{ ... }@args:
let
  flake =
    let
      lock = builtins.fromJSON (builtins.readFile ./flake.lock);
      flake-compatish = import (builtins.fetchTree lock.nodes.flake-compatish.locked);
    in
    flake-compatish {
      source = ./.;
      overrides = {
        self = ./.;
        nixpkgs = /etc/nixpkgs;
        nix-csi = /home/lillecarl/Code/nix-csi;
        easykubenix = /home/lillecarl/Code/easykubenix;
      };
    };
in
flake
