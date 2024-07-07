{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    qemu
    quickemu
    virt-manager
    iproute2
    libvirt
  ];
}
