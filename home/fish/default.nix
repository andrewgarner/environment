{
  programs.fish = {
    enable = true;

    functions = {
      gi = "curl -sL https://www.gitignore.io/api/$argv";
    };

    shellAbbrs = {
      d = "docker";
      e = "encore";

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

      gti = "gt init";
      gtc = "gt create";
      gts = "gt submit";
      gtm = "gt modify";
      gtr = "gt restack";
      gtco = "gt checkout";
      gtl = "gt log";
      gtu = "gt up";
      gtd = "gt down";

      n = "nix";
      nfmt = "nix fmt";
    };

    shellInit = ''
      set --universal fish_greeting

      set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
      set -gx HOMEBREW_NO_ANALYTICS "1";
      set -gx HOMEBREW_NO_ENV_HINTS "1";
      set -gx HOMEBREW_PREFIX "/opt/homebrew";
      set -gx HOMEBREW_REPOSITORY "/opt/homebrew";

      fish_add_path -gP "/opt/homebrew/bin" "/opt/homebrew/sbin";

      ! set -q MANPATH; and set MANPATH ""; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
      ! set -q INFOPATH; and set INFOPATH ""; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

      source "$GHOSTTY_RESOURCES_DIR"/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
    '';
  };
}
