{
  programs.aerospace = {
    enable = true;
    package = null;

    userSettings = {
      "after-login-command" = [ ];
      "after-startup-command" = [ ];
      "start-at-login" = true;
      "enable-normalization-flatten-containers" = true;
      "enable-normalization-opposite-orientation-for-nested-containers" = true;
      "accordion-padding" = 20;
      "default-root-container-layout" = "accordion";
      "default-root-container-orientation" = "auto";
      "on-focused-monitor-changed" = [ "move-mouse monitor-lazy-center" ];
      "automatically-unhide-macos-hidden-apps" = false;

      "key-mapping".preset = "qwerty";

      gaps = {
        inner.horizontal = 20;
        inner.vertical = 20;
        outer.left = 20;
        outer.bottom = 20;
        outer.top = 20;
        outer.right = 20;
      };

      "workspace-to-monitor-force-assignment" = {
        Messages = "secondary";
        Other = "secondary";
      };

      mode.main.binding = {
        "alt-shift-space" = "exec-and-forget open -a Claude";
        "alt-slash" = "layout tiles horizontal vertical";
        "alt-comma" = "layout accordion horizontal vertical";
        "alt-h" = "focus left";
        "alt-j" = "focus down";
        "alt-k" = "focus up";
        "alt-l" = "focus right";
        "alt-shift-h" = "move left";
        "alt-shift-j" = "move down";
        "alt-shift-k" = "move up";
        "alt-shift-l" = "move right";
        "alt-shift-keypadMinus" = "resize smart -50";
        "alt-shift-keypadPlus" = "resize smart +50";
        "alt-shift-keypadMultiply" = "balance-sizes";
        "alt-a" = "workspace Audio";
        "alt-b" = "workspace Browser";
        "alt-c" = "workspace Code";
        "alt-m" = "workspace Messages";
        "alt-n" = "workspace Notes";
        "alt-o" = "workspace Other";
        "alt-t" = "workspace Terminal";
        "alt-w" = "workspace Workspace";
        "alt-keypad1" = "workspace 1";
        "alt-keypad2" = "workspace 2";
        "alt-keypad3" = "workspace 3";
        "alt-keypad4" = "workspace 4";
        "alt-keypad5" = "workspace 5";
        "alt-keypad6" = "workspace 6";
        "alt-keypad7" = "workspace 7";
        "alt-keypad8" = "workspace 8";
        "alt-keypad9" = "workspace 9";
        "alt-shift-a" = "move-node-to-workspace --focus-follows-window Audio";
        "alt-shift-b" = "move-node-to-workspace --focus-follows-window Browser";
        "alt-shift-c" = "move-node-to-workspace --focus-follows-window Code";
        "alt-shift-m" = "move-node-to-workspace --focus-follows-window Messages";
        "alt-shift-n" = "move-node-to-workspace --focus-follows-window Notes";
        "alt-shift-o" = "move-node-to-workspace --focus-follows-window Other";
        "alt-shift-t" = "move-node-to-workspace --focus-follows-window Terminal";
        "alt-shift-w" = "move-node-to-workspace --focus-follows-window Workspace";
        "alt-shift-keypad1" = "move-node-to-workspace --focus-follows-window 1";
        "alt-shift-keypad2" = "move-node-to-workspace --focus-follows-window 2";
        "alt-shift-keypad3" = "move-node-to-workspace --focus-follows-window 3";
        "alt-shift-keypad4" = "move-node-to-workspace --focus-follows-window 4";
        "alt-shift-keypad5" = "move-node-to-workspace --focus-follows-window 5";
        "alt-shift-keypad6" = "move-node-to-workspace --focus-follows-window 6";
        "alt-shift-keypad7" = "move-node-to-workspace --focus-follows-window 7";
        "alt-shift-keypad8" = "move-node-to-workspace --focus-follows-window 8";
        "alt-shift-keypad9" = "move-node-to-workspace --focus-follows-window 9";
        "alt-tab" = "workspace-back-and-forth";
        "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";
        "alt-shift-semicolon" = "mode service";
      };

      mode.service.binding = {
        esc = [
          "reload-config"
          "mode main"
        ];
        r = [
          "flatten-workspace-tree"
          "mode main"
        ];
        f = [
          "layout floating tiling"
          "mode main"
        ];
        backspace = [
          "close-all-windows-but-current"
          "mode main"
        ];
        "alt-shift-h" = [
          "join-with left"
          "mode main"
        ];
        "alt-shift-j" = [
          "join-with down"
          "mode main"
        ];
        "alt-shift-k" = [
          "join-with up"
          "mode main"
        ];
        "alt-shift-l" = [
          "join-with right"
          "mode main"
        ];
      };

      "on-window-detected" = [
        {
          "if"."app-id" = "com.apple.Music";
          run = "move-node-to-workspace Audio";
        }
        {
          "if"."app-id" = "com.apple.podcasts";
          run = "move-node-to-workspace Audio";
        }
        {
          "if"."app-id" = "com.apple.Safari";
          run = "move-node-to-workspace Browser";
        }
        {
          "if"."app-id" = "com.jetbrains.WebStorm";
          run = "move-node-to-workspace Code";
        }
        {
          "if"."app-id" = "dev.zed.Zed";
          run = "move-node-to-workspace Code";
        }
        {
          "if"."app-id" = "come.apple.MobileSMS";
          run = "move-node-to-workspace Messages";
        }
        {
          "if"."app-id" = "net.whatsapp.WhatsApp";
          run = "move-node-to-workspace Messages";
        }
        {
          "if"."app-id" = "com.apple.Notes";
          run = "move-node-to-workspace Notes";
        }
        {
          "if"."app-id" = "notion.id";
          run = "move-node-to-workspace Workspace";
        }
        {
          "if"."app-id" = "notion.calendar.id";
          run = "move-node-to-workspace Workspace";
        }
        {
          "if"."app-id" = "notion.mail.id";
          run = "move-node-to-workspace Workspace";
        }
        {
          "if"."app-id" = "com.anthropic.claudefordesktop";
          run = "move-node-to-workspace Workspace";
        }
        {
          "if"."app-id" = "com.apple.reminders";
          run = "move-node-to-workspace Other";
        }
        {
          "if"."app-id" = "com.mitchellh.ghostty";
          run = [
            "layout tiling"
            "move-node-to-workspace Terminal"
          ];
        }
      ];
    };
  };
}
