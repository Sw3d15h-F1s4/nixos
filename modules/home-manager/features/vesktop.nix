{ mylib, config, ... }:
let
  clib = mylib.colors;
  colors = config.myHomeManager.colors;
in
{
  xdg.configFile."vesktop/themes/customtheme.css".text = ''
    /**
     * @name ClearVision V7 but everforest
     * @author ClearVision Team and me hahah
     * @version 7.0.0
     * @description Highly customizable theme for BetterDiscord.
     * @source https://github.com/ClearVision/ClearVision-v7
     * @website https://clearvision.github.io
     * @invite dHaSxn3
     */
    /* IMPORT CSS */
    @import url("https://clearvision.github.io/ClearVision-v7/main.css");
    @import url("https://clearvision.github.io/ClearVision-v7/betterdiscord.css");
    /* SETTINGS */
    :root {
      /* ACCENT COLORS */
      --main-color: #${colors.bg_green};
      --hover-color: #3c4841;
      --success-color: #${colors.cyan};
      --danger-color: #${colors.red};
      /* STATUS COLORS */
      --online-color: #${colors.green};
      --idle-color: #${colors.yellow};
      --dnd-color: #${colors.red};
      --streaming-color: #${colors.purple};
      --offline-color: #${colors.lightgray};
      /* APP BACKGROUND */
      --background-shading-percent: 50%;
      --background-image: none;
      --background-attachment: fixed;
      --background-filter: saturate(calc(var(--saturation-factor, 1) * 1));
      /* USER POPOUT BACKGROUND */
      --user-popout-image: var(--background-image);
      --user-popout-attachment: var(--background-attachment);
      --user-popout-filter: var(--background-filter);
      /* USER MODAL BACKGROUND */
      --user-modal-image: var(--background-image);
      --user-modal-attachment: var(--background-attachment);
      --user-modal-filter: var(--background-filter);
      /* HOME ICON */
      --home-icon: url(https://clearvision.github.io/icons/discord.svg);
      /* FONTS */
    }

    /* DARK THEME */
    :is(.theme-darker, .theme-light .theme-darker) {
      --background-shading: #${colors.bg_dim}80;
      --card-shading: #${colors.bg0}CC;
      --popout-shading: #${colors.bg1}CC;
      --modal-shading: #${colors.bg2}CC;
      --input-shading: #${colors.bg3}CC;
      --normal-text: #${colors.text}CC;
      --muted-text: #${colors.text}CC;
    }
    '';

}
