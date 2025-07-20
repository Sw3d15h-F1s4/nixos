{ ... }:

{
  programs.nixvim = {
    opts = {
      # Enable the mouse
      mouse = "a";

      # Don't show the mode, it's in the status line
      showmode = false;

      # Enable break indent
      breakindent = true;

      # Disable file undo history. I'm not a big fan personally.
      undofile = false;

      # Case-insensitive searching unless \C or a capital letter is in the search
      ignorecase = true;
      smartcase = true;

      # Keep the signcolumn on by default
      signcolumn = "yes";

      # Decrease default update time
      updatetime = 250;
      timeoutlen = 300;

      # Open new splits towards the bottom right instead of top left
      splitright = true;
      splitbelow = true;

      # Show whitespace characters
      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };
      fillchars = "eob: ";

      # Preview substitutions in a split
      inccommand = "split";
      incsearch = true;
      hlsearch = true;

      # Show a cursorline
      cursorline = true;

      # Minimal padding around the screen
      scrolloff = 8;
      sidescroll = 8;

      # Tab characters should become two spaces.
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;

      # disable automatic folding?? ew!?!
      foldmethod="manual";

      # Now default in nvim 10.0!
      termguicolors = true;

      # for neovide!
      guifont = "JetBrainsMono NF:h12";

      wrap = false;
      linebreak = true;
    };

    diagnostic.settings = {
      underline = true;
      virtual_text = true;
      signs = true;
    };
  };
}
