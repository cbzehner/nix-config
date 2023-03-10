{ config, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        # eighties theme (source: https://github.com/rajasegar/alacritty-themes/blob/master/themes/Eighties.dark.yml)
        # Default colors
        primary = {
          background = "#2d2d2d";
          foreground = "#d3d0c8";
        };

        # Colors the cursor will use if `custom_cursor_colors` is true
        cursor = {
          text = "#2d2d2d";
          cursor = "#d3d0c8";
        };

        # Normal colors
        normal = {
          black =   "#2d2d2d";
          red =     "#f2777a";
          green =   "#99cc99";
          yellow =  "#ffcc66";
          blue =    "#6699cc";
          magenta = "#cc99cc";
          cyan =    "#66cccc";
          white =   "#d3d0c8";
        };

        # Bright colors
        bright = {
          black =   "#747369";
          red =     "#f2777a";
          green =   "#99cc99";
          yellow =  "#ffcc66";
          blue =    "#6699cc";
          magenta = "#cc99cc";
          cyan =    "#66cccc";
          white =   "#f2f0ec";
        };

        draw_bold_text_with_bright_colors = false;

      # colors = {
      #   # eighties theme (source: https://github.com/chriskempson/base16)
      #   # Default colors
      #   primary = {
      #     background = "#${config.colorScheme.colors.base00}";
      #     foreground = "#${config.colorScheme.colors.base05}";
      #   };

      #   # Colors the cursor will use if `custom_cursor_colors` is true
      #   cursor = {
      #     text = "#${config.colorScheme.colors.base00}";
      #     cursor = "#${config.colorScheme.colors.base05}";
      #   };

      #   # Normal colors
      #   normal = {
      #     black =   "#${config.colorScheme.colors.base00}";
      #     red =     "#${config.colorScheme.colors.base08}";
      #     green =   "#${config.colorScheme.colors.base0B}";
      #     yellow =  "#${config.colorScheme.colors.base0A}";
      #     blue =    "#${config.colorScheme.colors.base0D}";
      #     magenta = "#${config.colorScheme.colors.base0E}";
      #     cyan =    "#${config.colorScheme.colors.base0C}";
      #     white =   "#${config.colorScheme.colors.base05}";
      #   };

      #   # Bright colors
      #   bright = {
      #     black =   "#${config.colorScheme.colors.base03}";
      #     red =     "#${config.colorScheme.colors.base09}";
      #     green =   "#${config.colorScheme.colors.base01}";
      #     yellow =  "#${config.colorScheme.colors.base02}";
      #     blue =    "#${config.colorScheme.colors.base04}";
      #     magenta = "#${config.colorScheme.colors.base06}";
      #     cyan =    "#${config.colorScheme.colors.base0F}";
      #     white =   "#${config.colorScheme.colors.base07}";
      #   };

      #   draw_bold_text_with_bright_colors = false;
      };
    };
  };
}

