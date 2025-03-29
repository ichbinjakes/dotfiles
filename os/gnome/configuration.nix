{ config, pkgs, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];
  environment.systemPackages = [ 
    pkgs.spice-vdagent
    pkgs.micromamba
    pkgs.go
    pkgs.rustc
    pkgs.cargo
    pkgs.zellij
    pkgs.delta
    pkgs.bat
    pkgs.yazi
    pkgs.alacritty
  ];
}
