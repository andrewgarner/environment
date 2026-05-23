# Architecture

The flake produces a single `darwinConfigurations.personal` output, wired together from three layers:

1. **`darwin/`** — System-level nix-darwin modules (`system.nix` for macOS defaults, `homebrew.nix` for Homebrew casks). Run as root; configure system-wide settings.

2. **`home/`** — Home Manager configuration. `home/default.nix` is the entry point; it imports one subdirectory per tool (e.g. `home/fish/`, `home/git/`, `home/neovim/`). Each subdirectory contains a `default.nix` and any associated config files.

3. **`flake.nix`** — Glues everything together. Passes a `profile` attrset (`{ name, email, username }`) as `specialArgs` so both darwin modules and Home Manager modules can reference user identity without hardcoding.

`home/neovim/config` is a git submodule pointing to `andrewgarner/config.nvim`. Clone with `--recurse-submodules`.
