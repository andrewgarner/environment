# Work environment setup

Create a private repo that imports this one as a flake input. This keeps employer-specific git identity, apps, and tool config out of the public repo while reusing all shared modules.

## Repo structure

```
environment-acme/
├── flake.nix
├── darwin/
│   └── homebrew.nix       # employer-specific casks (e.g. Slack)
└── home/
    ├── default.nix        # { imports = [ ./claude ./git ]; }
    ├── claude/
    │   └── default.nix    # work permissions + plugins
    └── git/
        └── default.nix    # work git identity
```

## flake.nix sketch

```nix
{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
    determinate = { url = "https://flakehub.com/f/DeterminateSystems/determinate/3"; inputs.nixpkgs.follows = "nixpkgs"; };
    darwin = { url = "https://flakehub.com/f/nix-darwin/nix-darwin/0"; inputs.nixpkgs.follows = "nixpkgs"; };
    home-manager = { url = "https://flakehub.com/f/nix-community/home-manager/0"; inputs.nixpkgs.follows = "nixpkgs"; };
    environment = {
      url = "github:andrewgarner/environment";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
    let
      system = "aarch64-darwin";
      profile = {
        name = "Andrew Garner";
        email = "work@acme.com";
        username = "work-username";
      };
    in {
      darwinConfigurations.work = inputs.darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit profile; };
        modules = [
          inputs.determinate.darwinModules.default
          inputs.environment.darwinModules.system
          inputs.environment.darwinModules.brewCommon
          inputs.environment.darwinModules.brewWork
          ./darwin/homebrew.nix

          inputs.home-manager.darwinModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = { inherit profile; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${profile.username} = {
                imports = [
                  inputs.environment.homeModules.default
                  ./home
                ];
              };
            };
          }
        ];
      };
    };
}
```

## What belongs where

| Item                                                                 | Public `brewWork` | Private `darwin/homebrew.nix` | Private `home/` |
| -------------------------------------------------------------------- | :---------------: | :---------------------------: | :-------------: |
| Slack, Teams, etc. (non-sensitive casks shared across work machines) |         ✓         |                               |                 |
| Employer-specific apps                                               |                   |               ✓               |                 |
| Work git identity (email, signing key)                               |                   |                               |        ✓        |
| Work Claude Code permissions / plugins                               |                   |                               |        ✓        |

## Extending config via module options

### Strategy A — write-back tools (Claude Code, Zed)

The public repo defines module options that accumulate across all imported modules. The private repo adds values using the same options:

```nix
# home/claude/default.nix in the private repo
{
  programs.claude.managed = {
    enabledPlugins."work-plugin@work" = true;
    permissions.allow = [ "Skill(some-work-thing)" ];
  };
}
```

The Nix module system concatenates `permissions.allow` lists from all layers (public common + public personal + private work). The activation script merges the combined result into the live `~/.claude/settings.json` on each rebuild, preserving keys that Claude Code writes itself (e.g. `attribution`).

### Strategy B — read-only tools (Aerospace, Mise)

These are generated purely from Nix. Override or extend by setting the same module options:

```nix
# Add a workspace binding in the private repo
{ config, lib, ... }:
{
  programs.aerospace.settings.mode.main.binding."alt-e" = "workspace Email";
}
```

```nix
# Add a work tool in the private repo
{
  programs.mise.managedConfig.tools.node = "lts";
}
```

### Ghostty

Use `programs.ghostty.settings` and `programs.ghostty.keybindings` to override or add settings. The Nix module system merges attrsets, so setting a key in the private repo overrides the public repo's value.

## Applying the configuration

```shell
sudo make PROFILE=work
```

