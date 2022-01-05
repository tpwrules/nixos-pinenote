self: super:
let
  pkgs = self;
  lib = pkgs.lib;
in {
  # main scope
  nixos-pinenote = lib.makeScope pkgs.newScope (self: with self; {
    rkdeveloptool = callPackage ./rkdeveloptool {};

    f2fs-vm = callPackage ./misc/f2fs-vm {};
  });
}
