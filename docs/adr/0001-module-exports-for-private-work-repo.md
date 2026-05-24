# ADR 0001: Export modules for private work-repo composition

## Status

Accepted

## Context

This repository is public. A work Mac needs a configuration that reuses the majority of these modules while adding employer-specific git identity, apps, and tool config. The work-specific details (email, signing keys, employer apps) must remain in a private repo.

## Decision

Export `homeModules.default` and split `darwinModules.brew*` so a private work repo can compose on top of this public one as a flake input.

```
inputs.environment.darwinModules.brewCommon   # shared casks
inputs.environment.darwinModules.brewWork     # non-sensitive work-common casks
inputs.environment.homeModules.default        # all Home Manager modules
```

The private repo imports these and adds its own delta modules alongside them.

## Alternatives considered

**Completely separate private repo (no sharing)** — duplicates all common config; personal and work machines drift apart over time.

**Private repo as the base, public as a layer** — requires every machine to have access to the private repo, breaking machines that only have public access.

## Consequences

- The public repo's Home Manager modules must define composable options (`listOf`, `attrsOf`) rather than hardcoded values, so the private repo can extend them via the module system.
- Config files for write-back tools (Claude Code, Zed) use activation-script merging rather than symlinks, so both repos can contribute managed values without copies.
- Config files for read-only tools (Aerospace, Ghostty, Mise) are generated purely from Nix, so the work repo can override or extend them via module options.
