# This module defines a NixOS installation CD that contains GNOME.

{ config, lib, options, pkgs, ... }:

{
  ## START: installation-cd-graphical-base.nix
  ## imports = [ ./installation-cd-graphical-base.nix ];

  imports = [
     <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-base.nix>
   ];

  # Whitelist wheel users to do anything
  # This is useful for things like pkexec
  #
  # WARNING: this is dangerous for systems
  # outside the installation-cd and shouldn't
  # be used anywhere else.
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';

  services.xserver.enable = true;

  # Provide networkmanager for easy wireless configuration.
  networking.networkmanager.enable = true;
  networking.wireless.enable = lib.mkImageMediaOverride false;

  # KDE complains if power management is disabled (to be precise, if
  # there is no power management backend such as upower).
  powerManagement.enable = true;

  # VM guest additions to improve host-guest interaction
  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
  # virtualisation.vmware.guest.enable = pkgs.stdenv.hostPlatform.isx86;
  # virtualisation.hypervGuest.enable = true;
  services.xe-guest-utilities.enable = pkgs.stdenv.hostPlatform.isx86;
  # The VirtualBox guest additions rely on an out-of-tree kernel module
  # which lags behind kernel releases, potentially causing broken builds.
  virtualisation.virtualbox.guest.enable = false;

  # Enable plymouth
  boot.plymouth.enable = true;

  environment.defaultPackages = with pkgs; [
    # Include gparted for partitioning disks.
    gparted

    # Include some editors.
    # vim
    # nano

    # Firefox for reading the manual.
    firefox

    # mesa-demos
  ];
  
  ## END: installation-cd-graphical-base.nix


  isoImage.edition = lib.mkDefault "gnome";

  services.xserver.desktopManager.gnome = {
    favoriteAppsOverride = ''
      [org.gnome.shell]
      favorite-apps=[ 'firefox.desktop', 'nixos-manual.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'gparted.desktop' ]
    '';
    enable = true;
  };

  services.xserver.displayManager.gdm = {
    enable = true;
    autoSuspend = false;
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "nixos";
  };

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
