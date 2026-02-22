{ pkgs, ... }: {
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ 
      # mozc
      mozc-ut
    ];
  };
}

