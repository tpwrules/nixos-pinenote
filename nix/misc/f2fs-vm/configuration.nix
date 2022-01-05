# https://github.com/nh2/nixos-vm-examples/blob/97af61c0fe71a47152380eb0cd4444be427e915f/grub-test-vm/configuration.nix

{ pkgs, lib, config, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    (modulesPath + "/virtualisation/qemu-vm.nix")
  ];

  config = {
    services.qemuGuest.enable = true;

    fileSystems."/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
      autoResize = true;
    };

    boot = {
      growPartition = true;
      kernelParams = [ "console=ttyS0" "boot.shell_on_fail" ];
    };

    virtualisation = {
      diskSize = 2000; # MB
      memorySize = 2048; # MB
      writableStoreUseTmpfs = true;

      sharedDirectories = {
        stuff = { source = "/home"; target = "/mnt/home"; };
      };

      useBootLoader = false;
    };

    boot.kernelPackages = pkgs.linuxPackages_latest;

    services.openssh.enable = false;
    users.extraUsers.root.password = "";
    users.mutableUsers = false;

    environment.systemPackages = with pkgs; [
      rsync
      f2fs-tools
    ];

  };
}
