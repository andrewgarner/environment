.PHONY: check clean develop format update

PROFILE := "personal"

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
	@nix run nix-darwin -- switch --flake ".?submodules=1#$(PROFILE)"

update:
	@echo "Updating flake..."
	@nix flake update
