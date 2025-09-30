{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ grim swappy slurp ];
}
