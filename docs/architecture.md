# Architecture

The flake produces a single `darwinConfigurations.personal` output, wired together from three layers:

1. **`darwin/`** — System-level nix-darwin modules (`system.nix` for macOS defaults, `homebrew.nix` for Homebrew casks). Run as root; configure system-wide settings.

2. **`home/`** — Home Manager configuration. `home/default.nix` is the entry point; it imports one subdirectory per tool (e.g. `home/fish/`, `home/git/`, `home/neovim/`). Each subdirectory contains a `default.nix` and any associated config files.

3. **`flake.nix`** — Glues everything together. Passes a `profile` attrset (`{ name, email, username }`) as `specialArgs` so both darwin modules and Home Manager modules can reference user identity without hardcoding.

`home/neovim/config` is a git submodule pointing to `andrewgarner/config.nvim`. Clone with `--recurse-submodules`.

## Exported flake outputs

The flake exports modules so a private work repo can compose on top of this one as a flake input (see [`docs/work-environment.md`](work-environment.md)):

```
darwinModules.system        # macOS system defaults
darwinModules.brewCommon    # casks shared by any developer Mac
darwinModules.brewPersonal  # personal-only casks (peripherals, personal apps)
darwinModules.brewWork      # placeholder for non-sensitive work-common casks
homeModules.default         # all Home Manager modules
```

## Config management strategies

Tools are split into two groups based on whether they write back to their config file at runtime.

### Strategy A — activation-script merge (write-back tools)

**Claude Code** and **Zed** write to their config files at runtime (via the update-config skill and the Zed UI respectively). Nix declares the managed portions as module options. A `home.activation` script merges them into the live file at `darwin-rebuild switch` time using `jq`, preserving any keys the tool has written.

```
programs.claude.managed.enabledPlugins   # attrsOf bool — merged across modules
programs.claude.managed.permissions.allow  # listOf str — concatenated across modules
programs.zed.managed                     # attrsOf anything — merged across modules
```

### Strategy B — pure Nix generation (read-only tools)

**Aerospace**, **Ghostty**, and **Mise** do not write to their config files at runtime. Nix generates the config file entirely from declared options — no symlink, no activation script, no live editing.

```
programs.aerospace.settings   # full TOML config, generated via pkgs.formats.toml
programs.ghostty.*            # managed by the Home Manager programs.ghostty module
programs.mise.managedConfig.tools  # attrsOf str, written as TOML via lib.generators.toTOML
```
