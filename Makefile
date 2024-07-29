.PHONY: check clean develop format

default: develop

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
