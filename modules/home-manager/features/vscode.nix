{ pkgs, ...}:

{

  programs.vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = true;
      mutableExtensionsDir = true;

      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
      ];

      keybindings = [
        {
            key = "ctrl+h";
            command = "workbench.action.previousEditor";
        }
        {
            key = "ctrl+l";
            command = "workbench.action.nextEditor";
        }
        {
            key = "ctrl+w k";
            command = "workbench.action.navigateUp";
        }
        {
            key = "ctrl+w j";
            command = "workbench.action.navigateDown";
        }
        {
            key = "ctrl+w h";
            command = "workbench.action.navigateLeft";
        }
        {
            key = "ctrl+w l";
            command = "workbench.action.navigateRight";
        }
        {
            key = "ctrl+w c";
            command = "workbench.action.navigateRight";
        }
        {
            key = "ctrl+w";
            command = "-workbench.action.navigateRight";
        }
      ];

      userSettings = {
        "search.collapseResults" = "auto";
        "search.smartCase" = true;
        "workbench.editor.splitInGroupLayout" = "vertical";
        "editor.cursorSurroundingLines" = 8;
        "workbench.startupEditor" = "none";
        "editor.minimap.enabled" = false;
        "vim.leader" = "<space>";
        "vim.normalModeKeyBindingsNonRecursive" = [
            {
                "before" = ["<leader>" "h"];
                "commands" = [":nohlsearch"];
            }
            {
                "before" = ["<S-q>"];
                "commands" = [":tabc"];
            }
            {
                "before" = ["<C-d>"];
                "after" = ["<C-d>" "z" "z"];
            }
            {
                "before" = ["<C-u>"];
                "after" = ["<C-u>" "z" "z"];
            }
            {
                "before" = ["n"];
                "after" = ["n" "z" "z" "z" "v"];
            }
            {
                "before" = ["N"];
                "after" = ["N" "z" "z" "z" "v"];
            }
            {
                "before" = ["<leader>" "e"];
                "commands" = ["workbench.view.explorer"];
            }
            {
                "before" = ["<leader>" "g" "g"];
                "commands" = ["workbench.view.scm"];
            }
            {
                "before" = ["<leader>" "x" "x"];
                "commands" = ["workbench.view.extensions"];
            }
            {
                "before" = ["<leader>" "f" "f"];
                "commands" = ["workbench.action.quickOpen"];
            }
            {
                "before" = ["<leader>" "f" "t"];
                "commands" = ["workbench.action.findInFiles"];
            }
            {
                "before" = ["<leader>" "f" "p"];
                "commands" = ["workbench.action.openRecent"];
            }
            {
                "before" = ["<leader>" "l" "f"];
                "commands" = ["editor.action.formatDocument"];
            }
            {
                "before" = ["<leader>" "l" "r"];
                "commands" = ["editor.action.rename"];
            }
            {
                "before" = ["<leader>" "l" "a"];
                "commands" = ["editor.action.quickFix"];
            }
            {
                "before" = ["<leader>" "l" "j"];
                "commands" = ["editor.action.marker.next"];
            }
            {
                "before" = ["<leader>" "l" "k"];
                "commands" = ["editor.action.marker.prev"];
            }
            {
                "before" = ["<leader>" "l" "s"];
                "commands" = ["editor.action.triggerParameterHints"];
            }
            {
                "before" = ["g" "I"];
                "commands" = ["editor.action.peekImplementation"];
            }
            {
                "before" = ["g" "r"];
                "commands" = ["editor.action.referenceSearch.trigger"];
            }
            {
                "before" = ["<leader>" "/"];
                "commands" = ["editor.action.commentLine"];
            }
            {
                "before" = ["<leader>" "d" "u"];
                "commands" = ["workbench.view.debug"];
            }
            {
                "before" = ["<leader>" "d" "b"];
                "commands" = ["editor.debug.action.toggleBreakpoint"];
            }
            {
                "before" = ["<leader>" "d" "c"];
                "commands" = ["workbench.debug.action.continue"];
            }
            {
                "before" = ["<leader>" "d" "i"];
                "commands" = ["workbench.debug.action.stepInto"];
            }
            {
                "before" = ["<leader>" "d" "o"];
                "commands" = ["workbench.debug.action.stepOver"];
            }
            {
                "before" = ["<leader>" "d" "O"];
                "commands" = ["workbench.debug.action.stepOut"];
            }
            {
                "before" = ["<leader>" "d" "r"];
                "commands" = ["workbench.debug.action.toggleRepl"];
            }
            {
                "before" = ["<leader>" "d" "l"];
                "commands" = ["workbench.debug.run"];
            }
            {
                "before" = ["<leader>" "d" "t"];
                "commands" = ["workbench.action.debug.terminateThread"];
            }
            {
                "before" = ["K"];
                "commands" = ["editor.action.showHover"];
            }

        ];
        "vim.visualModeKeyBindingsNonRecursive" = [
            {
                "before" = ["<"];
                "commands" = ["editor.action.outdentLines"];
            }
            {
                "before" = [">"];
                "commands" = ["editor.action.indentLines"];
            }
            {
                "before" = ["<leader>" "/"];
                "commands" = ["editor.action.commentLine"];
            }
        ];
        "vim.easymotion" = true;
        "vim.sneak" = true;
        "autoHide.hideOnOpen" = false;
      };
  };
}
