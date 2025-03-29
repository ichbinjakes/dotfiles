{ config, pkgs, ... }:
{
  imports = [
    # https://github.com/NixOS/nixpkgs/tree/release-24.11/nixos/modules/installer/cd-dvd
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix>
    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];
  environment.systemPackages = [ 
    pkgs.neovim
    pkgs.spice-vdagent
    # https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html
    # https://github.com/cachix/devenv/issues/321#issuecomment-1402077347
    pkgs.micromamba
    pkgs.go
    pkgs.rustc
    pkgs.cargo
  ];
}
