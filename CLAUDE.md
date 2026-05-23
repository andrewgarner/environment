# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Nix flake-based macOS development environment using nix-darwin, Home Manager, and Homebrew. Targets `aarch64-darwin` only. The single profile (`personal`) drives all configuration.

## Commands

```shell
sudo make       # Apply configuration — do not run darwin-rebuild switch directly
make check      # Check the flake for errors
make format     # Format all Nix files
make update     # Update flake.lock
```

## Further reading

- [Architecture](docs/architecture.md)
- [Conventions](docs/conventions.md)
