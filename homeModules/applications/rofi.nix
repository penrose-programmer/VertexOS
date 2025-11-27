{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
  };

  xdg.configFile."rofi/config.rasi".text = ''
    * {
        font: "JetBrains Mono Nerd Font 12";

        bg0: #0F1419;
        bg1: #131721;
        fg0: #E6E1CF;

        accent-color: #FFB454;   /* orange */
        urgent-color: #F07178;

        background-color: transparent;
        text-color: #FFFFFF;

        margin: 0;
        padding: 0;
        spacing: 0;
    }

    window {
        location: center;
        width: 480;

        background-color: #0F1419;
    }

    inputbar {
        spacing: 8px;
        padding: 8px;
        
        text-color: #FFFFFF;
        background-color: #131721;
    }

    prompt {
        text-color: #FFFFFF;
    }

    textbox {
        padding:            8px;
        background-color:   #0F1419;
        text-color: #FFFFFF;
    }

    element {
        padding:    8px;
        spacing:    8px;
    }

    element normal normal {
        background-color: @bg0;
        text-color: @fg0;
    }

    element normal urgent {
        text-color: @urgent-color;
    }

    element normal active {
        text-color: @accent-color;
    }

    element alternate normal {
        background-color:   #272D38; /* base02, darker than bg0 for contrast */
        text-color:         @fg0;
    }

    element alternate active {
        text-color: @accent-color;
        background-color:   #3E4B59; /* base03, slightly lighter for selection */
    }

    element selected {
        text-color: @bg0;
    }

    element selected normal, element selected active {
        background-color:   @accent-color;
    }

    element selected urgent {
        background-color:   @urgent-color;
    }

    element-icon {
        size:   0.8em;
    }

    element-text {
        text-color: inherit;
    }
  '';
}
