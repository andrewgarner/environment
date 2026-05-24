{
  lib,
  config,
  pkgs,
  ...
}:
let
  managedJson = pkgs.writeText "claude-managed.json" (
    builtins.toJSON {
      enabledPlugins = config.programs.claude.managed.enabledPlugins;
      permissions = {
        allow = config.programs.claude.managed.permissions.allow;
      };
    }
  );
in
{
  options.programs.claude.managed = {
    enabledPlugins = lib.mkOption {
      type = lib.types.attrsOf lib.types.bool;
      default = { };
    };
    permissions.allow = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };

  config = {
    programs.claude.managed.enabledPlugins = {
      "commit-commands@claude-plugins-official" = true;
      "context7@claude-plugins-official" = true;
      "github@claude-plugins-official" = true;
      "typescript-lsp@claude-plugins-official" = true;
    };

    programs.claude.managed.permissions.allow = [
      "Skill(commit-commands:commit)"
      "Skill(commit-commands:commit-push-pr)"
      "Skill(commit-commands:clean_gone)"
    ];

    home.activation.claudeSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      dest="$HOME/.claude/settings.json"
      mkdir -p "$(dirname "$dest")"
      if [ -f "$dest" ]; then
        current_json=$(cat "$dest")
      else
        current_json="{}"
      fi
      printf '%s' "$current_json" | \
        ${pkgs.jq}/bin/jq -s '.[0] * .[1]' - ${managedJson} > "$dest.tmp" \
        && mv "$dest.tmp" "$dest"
    '';
  };
}
