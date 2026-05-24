{
  programs.mise = {
    enable = true;

    globalConfig = {
      settings = {
        idiomatic_version_file_enable_tools = [
          "go"
          "java"
          "opentofu"
          "python"
          "ruby"
          "terraform"
          "yarn"
        ];
        ruby.compile = false;
      };

      tools = {
        bun = "latest";
        commitlint-rs = "latest";
        java = "latest";
        lefthook = "latest";
        node = "latest";
        opentofu = "latest";
        prek = "latest";
        ruby = "latest";
        terraform = "latest";
        uv = "latest";

        "npm:@github/copilot" = "latest";
        "npm:@pnpm/exe" = "latest";
        "npm:npm-check-updates" = "latest";
        "npm:prettier" = "latest";
        "npm:prettier-plugin-sort-json" = "latest";
        "npm:typescript-language-server" = "latest";
      };
    };
  };

  programs.fish.shellAbbrs = {
    m = "mise";
    ma = "mise alias";
    mb = "mise backends";
    mcfg = "mise config";
    mdr = "mise doctor";
    me = "mise env";
    mfmt = "mise fmt";
    mi = "mise install";
    mln = "mise link";
    mls = "mise list";
    mps = "mise plugins";
    mr = "mise run";
    mrm = "mise unuse";
    msh = "mise shell";
    mt = "mise tasks";
    mu = "mise use";
    mup = "mise upgrade";
    mw = "mise watch";
    mx = "mise exec --";
  };
}
