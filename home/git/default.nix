{profile, ...}: {
  programs.git = {
    enable = true;
    userName = profile.name;
    userEmail = profile.email;

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
        fsmonitor = true;
        pager = "less -FRSX";
        whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
        untrackedcache = true;
      };

      credential.helper = "osxkeychain";

      diff = {
        algorithm = "histogram";
        tool = "zed";
      };

      difftool = {
        zed = {
          cmd = "zed --diff $LOCAL $REMOTE";
          prompt = false;
        };
      };

      fetch.prune = true;

      format.pretty = "oneline";

      help.autocorrect = 1;

      init.defaultBranch = "main";

      merge = {
        tool = "zed";

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
        keepBackup = false;
        zed = {
          cmd = "zed --merge $BASE $LOCAL $REMOTE $MERGED";
        };
      };

      pull = {
        default = "current";
        rebase = true;
      };

      push = {
        autosetupremote = true;
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

      ### Mise ###
      "mise.local.toml"
      "mise.*.local.toml"
    ];

    signing = {
      key = "32CB397255B842EF";
      signByDefault = true;
    };
  };

  programs.gh = {
    enable = true;
  };

  programs.fish.functions = {
    gi = "curl -sL https://www.gitignore.io/api/$argv";
  };

  programs.fish.shellAbbrs = {
    g = "git";
    ga = "git add --patch";
    gb = "git branch";
    gc = "git commit --verbose";
    gca = "git commit --verbose --amend";
    gcb = "git checkout -b";
    gcl = "git clone --recurse-submodules";
    gcm = "git commit --message";
    gco = "git checkout";
    gcp = "git cherry-pick";
    gd = "git diff";
    gf = "git fetch";
    glol = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
    gm = "git merge";
    gp = "git push";
    gpf = "git push --force-with-lease";
    gpr = "git pull --rebase";
    grb = "git rebase";
    grba = "git rebase --abort";
    grbc = "git rebase --continue";
    grbi = "git rebase --interactive";
    grbs = "git rebase --skip";
    grm = "git rm";
    gst = "git status";
    gss = "git status --short";
  };
}
