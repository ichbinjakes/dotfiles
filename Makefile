# Create symlinks for configuration files.
link:
	stow \
	  -S bash \
	  -S dotfiles \
	  -S git
	bat cache --build

# Remnove symlinks for configuration files.
unlink:
	stow \
	  -D bash \
	  -D dotfiles \
	  -D git
	bat cache --build

# Create a bootable NixOS ISO with dependencies pre-installed.
gnome-iso:
	nix-build \
		'<nixpkgs/nixos>' \
		-A config.system.build.isoImage \
		-I nixos-config=configuration.nix

# Create a docker container with dependencies and configuration pre-installed.
