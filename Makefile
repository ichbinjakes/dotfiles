# Create symlinks for configuration files.
link:
	stow \
	  -S bash \
	  -S helix \
	  -S starship \
	  -S bat \
	  -S git

# Remnove symlinks for configuration files.
unlink:
	stow \
	  -D bash \
	  -D helix \
	  -D starship \
	  -D bat \
	  -D git

# Create a bootable NixOS ISO with dependencies pre-installed.
gnome-iso:
	nix-build \
		'<nixpkgs/nixos>' \
		-A config.system.build.isoImage \
		-I nixos-config=configuration.nix

# Create a docker container with dependencies and configuration pre-installed.
