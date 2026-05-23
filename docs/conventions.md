# Conventions

- **Pre-commit hook** auto-formats staged `*.nix` files with `nix fmt` and re-stages them — no need to format manually before committing.
- **`profile` argument** is available in all modules. Use it instead of hardcoding names, emails, or usernames.
- **Adding a new tool**: create `home/<tool>/default.nix`, then add `(import ./<tool>)` to the `imports` list in `home/default.nix`.
