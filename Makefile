.PHONY: check clean develop format update

default: install

check:
	@echo "Checking flake..."
	@nix flake check

clean:
	@echo "Cleaning up..."
	@nix-collect-garbage -d

develop:
	@echo "Building..."
	@nix develop

format:
	@echo "Formatting..."
	@nix fmt

install:
	@echo "Installing..."
	@nix run .#homeConfigurations.andrewgarner.activationPackage

update:
	@echo "Updating flake..."
	@nix flake update
