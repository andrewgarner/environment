{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default.userSettings = {
      "editor.accessibilitySupport" = "off";
      "editor.fontFamily" = "'TX-02', monospace";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 14;
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.renderWhitespace" = "boundary";
      "editor.semanticHighlighting.enabled" = true;
      "files.autoGuessEncoding" = true;
      "files.readonlyFromPermissions" = true;
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "telemetry.telemetryLevel" = "off";
      "window.autoDetectColorScheme" = true;
      "workbench.preferredDarkColorTheme" = "Tokyo Night";
      "workbench.preferredLightColorTheme" = "Tokyo Night Light";
    };

    profiles.default.extensions = with pkgs.vscode-extensions; [
      bradlc.vscode-tailwindcss
      dbaeumer.vscode-eslint
      editorconfig.editorconfig
      enkia.tokyo-night
      esbenp.prettier-vscode
      github.vscode-github-actions
      github.vscode-pull-request-github
      golang.go
      jnoortheen.nix-ide
      redhat.vscode-xml
      redhat.vscode-yaml
    ];
  };
}
