{ pkgs }:
(import (pkgs.path + "/nixos/lib/eval-config.nix") {
  specialArgs = { modulesPath = pkgs.path + "/nixos/modules"; };
  modules = [ ./configuration.nix ];
}).config.system.build.vm
