{
  lib,
  config,
  pkgs,
  ...
}:
let
  managedJson = pkgs.writeText "zed-managed.json" (builtins.toJSON config.programs.zed.managed);
in
{
  options.programs.zed.managed = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    default = { };
  };

  config = {
    programs.zed.managed = {
      active_pane_modifiers = {
        magnification = 1.25;
        inactive_opacity = 0.5;
      };
      auto_install_extensions = {
        html = true;
        tokyo-night = true;
      };
      autosave = "on_focus_change";
      base_keymap = "JetBrains";
      buffer_font_family = "TX-02";
      calls.mute_on_join = true;
      collaboration_panel.dock = "right";
      features.edit_prediction_provider = "zed";
      git_panel.dock = "right";
      languages = {
        JSON.prettier = {
          allowed = true;
          plugins = [ "prettier-plugin-sort-json" ];
        };
        JSONC.prettier = {
          allowed = true;
          plugins = [ "prettier-plugin-sort-json" ];
        };
      };
      outline_panel.dock = "right";
      project_panel.dock = "right";
      relative_line_numbers = true;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      terminal.env.EDITOR = "zed --wait";
      theme = {
        mode = "system";
        dark = "Tokyo Night";
        light = "Tokyo Night Light";
      };
      ui_font_family = ".SystemUIFont";
      vim_mode = false;
    };

    home.activation.zedSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      dest="${config.xdg.configHome}/zed/settings.json"
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
