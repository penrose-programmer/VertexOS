{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "penrose-programmer";
    userEmail = "syedtalhahahmed@gmail.com";

    extraConfig = {
      credential.helper = "cache --timeout=3600";
    };
  };
}
