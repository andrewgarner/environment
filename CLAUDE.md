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

## Package management

Homebrew (`darwin/homebrew.nix`) manages GUI apps and tools distributed as casks — check there before adding a package to Nix. Do not duplicate a package across both. When adding a new tool, decide which layer owns it:

- **Homebrew casks** — GUI apps, Electron apps, or binaries distributed via cask (e.g. `claude-code`, `ghostty`, `zed`)
- **`home.packages`** — CLI tools and libraries available in nixpkgs
- **`home/<tool>/default.nix`** — tools with non-trivial Home Manager configuration

## Further reading

- [Architecture](docs/architecture.md)
- [Conventions](docs/conventions.md)
