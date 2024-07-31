.PHONY: check clean develop format update

default: update

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

update:
	@echo "Switching home-manager configuration..."
	@home-manager switch -b backup --flake .#$(USER)
