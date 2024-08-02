{
  programs.git = {
    enable = true;
    userName = "Andrew Garner";
    userEmail = "andrew@andrewgarner.com";

    attributes = [
      # Automatically normalise line endings for all text-based files
      "* text=auto"

      # Automatically merge Node Package Manager lockfiles
      "npm-shrinkwrap.json merge=npm-merge-driver"
      "package-lock.json merge=npm-merge-driver"

      # Automatically merge pnpm lockfiles
      "pnpm-lock.yaml merge=pnpm-merge-driver"

      # Automatically merge yarn lockfiles
      "yarn.json merge=yarn-merge-driver"
      "yarn.lock merge=yarn-merge-driver"
    ];

    extraConfig = {
      apply.whitespace = "fix";

      branch.autosetuprebase = "always";

      color = {
        branch = "always";
        diff = "always";
        grep = "always";
        interactive = "always";
        pager = true;
        showbranch = "auto";
        status = "auto";
        ui = "always";
      };

      core = {
        editor = "code --wait";
        pager = "less -FRSX";
        whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      };

      credential.helper = "osxkeychain";

      diff.tool = "vscode";

      difftool = {
        vscode = {
          cmd = "code --wait --diff $LOCAL $REMOTE";
          prompt = false;
        };
      };

      fetch.prune = true;

      format.pretty = "oneline";

      help.autocorrect = 1;

      init.defaultBranch = "main";

      merge = {
        tool = "vscode";

        npm-merge-driver = {
          name = "Automatically merge Node Package Manager lockfiles";
          driver = "npx npm-merge-driver merge %A %O %B %P";
        };

        pnpm-merge-driver = {
          name = "Automatically merge pnpm lockfiles";
          driver = "pnpm --package=@pnpm/merge-driver dlx pnpm-merge-driver %A %O %B %P";
        };

        yarn-merge-driver = {
          name = "Automatically merge Yarn lockfiles";
          driver = "npx npm-merge-driver merge %A %O %B %P -c yarn";
        };
      };

      mergetool = {
        vscode = {
          cmd = "code --wait --diff $LOCAL $REMOTE";
        };
      };

      pull = {
        default = "current";
        rebase = true;
      };

      push = {
        default = "current";
      };

      rebase = {
        autosquash = true;
        autostash = true;
      };

      url = {
        "git@github.com:" = {
          insteadOf = "github:";
        };
      };
    };

    ignores = [
      # Created by https://www.toptal.com/developers/gitignore/api/macos
      # Edit at https://www.toptal.com/developers/gitignore?templates=macos

      ### macOS ###
      # General
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"

      # Icon must end with two \r
      "Icon"

      # Thumbnails
      "._*"

      # Files that might appear in the root of a volume
      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ".com.apple.timemachine.donotpresent"

      # Directories potentially created on remote AFP share
      ".AppleDB"
      ".AppleDesktop"
      "Network Trash Folder"
      "Temporary Items"
      ".apdisk"

      ### macOS Patch ###
      # iCloud generated files
      "*.icloud"

      # End of https://www.toptal.com/developers/gitignore/api/macos
    ];

    signing = {
      key = "32CB397255B842EF";
      signByDefault = true;
    };
  };

  programs.gh = {
    enable = true;
  };
}
