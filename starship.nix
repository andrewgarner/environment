{
  programs.starship = {
    enable = true;
    settings = {
      nix_shell = {
        disabled = false;
        heuristic = true;
      };
    };
  };
}
