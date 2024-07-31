{
  home = {
    username = "andrewgarner";
    homeDirectory = "/Users/andrewgarner";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;

    awscli = {
      enable = true;
      settings = {
        "default" = {
          region = "eu-west-2";
        };

        "profile AndrewGarner-AdministratorAccess" = {
          sso_account_id = "767397922954";
          sso_role_name = "AdministratorAccess";
          sso_session = "AndrewGarner";
        };

        "sso-session AndrewGarner" = {
          sso_region = "eu-west-2";
          sso_registration_scopes = "sso:account:access";
          sso_start_url = "https://andrewgarner.awsapps.com/start";
        };
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fish = {
      enable = true;

      shellAbbrs = {
        d = "docker";

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

        n = "nix";
        nfmt = "nix fmt";
      };

      shellInit = ''
        set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
        set -gx HOMEBREW_NO_ANALYTICS "1";
        set -gx HOMEBREW_NO_ENV_HINTS "1";
        set -gx HOMEBREW_PREFIX "/opt/homebrew";
        set -gx HOMEBREW_REPOSITORY "/opt/homebrew";

        fish_add_path -gP "/opt/homebrew/bin" "/opt/homebrew/sbin";

        ! set -q MANPATH; and set MANPATH ""; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
        ! set -q INFOPATH; and set INFOPATH ""; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
      '';
    };

    git = {
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

    gh = {
      enable = true;
    };

    starship = {
      enable = true;
      settings = {
        nix_shell = {
          disabled = false;
          heuristic = true;
        };
      };
    };
  };
}
