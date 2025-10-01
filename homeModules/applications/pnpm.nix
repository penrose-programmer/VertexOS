{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    pnpm 
    nodejs_22
  ];
}
