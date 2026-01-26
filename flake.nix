{
  inputs = {
    flake-compatish = {
      url = "github:lillecarl/flake-compatish";
      flake = false;
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = _: { };
}
