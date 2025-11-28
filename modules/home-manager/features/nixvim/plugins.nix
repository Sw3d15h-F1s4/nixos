{ ... }:
{
  programs.nixvim.plugins = {
    nvim-tree = {
      enable = true;
    };

    which-key = {
      enable = true;
      settings = {
        showKeys = true;
      };
    };

    luasnip = {
      enable = true;
    };

    blink-cmp-spell= {
      enable=true;
    };

    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "super-tab";
        sources = {
          providers = {
            spell = {
              module = "blink-cmp-spell";
              name = "Spell";
              score_offset = 100;
              opts = {};
            };
          };
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
            "spell"
          ];
        };
      };
    };

    nvim-autopairs = {
      enable = true;
    };

    lsp = {
      enable = true;
      servers = {
        lua_ls  = {enable = true;};
        clangd  = {enable = true;};
        nil_ls  = {enable = true;};
        texlab  = {
          enable = true;
          settings = {
            texlab.build = {
              executable = "tectonic";
              args = [
                "-X"
                "compile"
                "%f"
                "--synctex"
                "--keep-logs"
                "--keep-intermediates"
              ];
            };
          };
        };
        pyright = {enable = true;};
        jsonls  = {enable = true;};
        yamlls  = {enable = true;};
        bashls = {enable = true;};
        fish_lsp = {enable = true;};
      };

      keymaps = {
        diagnostic = {
          "<leader>de" = "open_float";
          "<leader>dq" = "setloclist";
        };

        lspBuf = {
          "grf" = "format";
        };
        extra = [
          {
            key = "grd";
            action.__raw = "require('telescope.builtin').lsp_definitions";
            options = {
              desc = "Peek Definitions";
            };
          }
          {
            key = "gI";
            action.__raw = "require('telescope.builtin').lsp_implementations";
            options = {
              desc = "Peek Implementations";
            };
          }
          {
            key = "gO";
            action.__raw = "require('telescope.builtin').lsp_document_symbols";
            options = {
              desc = "Document Symbols";
            };
          }
        ];
      };
    };

    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        indent.enable = true;
      };
    };

    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };

    cursorline = {
      enable = true;
    };

    mini = {
      enable = true;
      modules = {
        ai = {
          n_lines = 500;
        };
      };
    };

    nvim-surround = {
     enable = true;
    };

    trouble = {
      enable = true;
    };

    toggleterm = {
      enable = true;
    };

    gitsigns = {
      enable = true;
    };

    lualine = {
      enable = false; # you can change this back when luarocks figures its shit out ig
      settings = {
        extensions = [ "nvim-tree" "toggleterm" "trouble" "quickfix"];
      };
    };

    mini-statusline = {
      enable = true;
    };

    schemastore = {
      enable = true;
    };

    web-devicons = {
      enable = true;
    };
  };
}
