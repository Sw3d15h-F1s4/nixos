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

    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        experimental.ghost_text = true;

        snippet.expand = "luasnip";
        completion.completeopt = "menu,menuone,noinsert";

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete {}";
          "<C-l>" = "cmp.mapping(function() if luasnip.expand_or_locally_jumpable(  ) then luasnip.expand_or_jump(  ) end end, {'i', 's' })";
          "<C-h>" = "cmp.mapping(function() if luasnip.expand_or_locally_jumpable(-1) then luasnip.expand_or_jump(-1) end end, {'i', 's' })";
        };

        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
        ];
      };
    };

    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
    cmp_luasnip = {
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

    mini = {
      enable = true;
      modules = {
        ai = {
          n_lines = 500;
        };
        surround = { };
      };
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
      enable = true;
      settings = {
        extensions = [ "nvim-tree" "toggleterm" "trouble" "quickfix"];
      };
    };

    schemastore = {
      enable = true;
    };

    web-devicons = {
      enable = true;
    };
  };
}
