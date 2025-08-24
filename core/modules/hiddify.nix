{ pkgs, ... }:
let
  hiddify_overlay = (self: super: {
    hiddify-app = super.hiddify-app.overrideAttrs (prev: {
      version = "git";
      src = pkgs.fetchFromGitHub {
        owner = "D3st0ny";
        repo = "hiddify-app";
        rev = "main";
        sha256 = "sha256-YitBXBIkjCcnfMM+ZgKyWqBHHUe0MqnjYxzHWWBfaCQ=";
      };
    });
  });
in
{
  nixpkgs.overlays = [ hiddify_overlay ];
  environment.systemPackages = [
    pkgs.hiddify-app
  ];
  security.wrappers.hiddify = {
    source      = "${pkgs.hiddify-app}/bin/hiddify";
    owner       = "root";
    group       = "root";
    capabilities = "cap_net_admin,cap_net_raw+ep";
  };
}
