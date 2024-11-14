_: {
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
        settings = {
          respect_gitignore = false;
          # folders first
          grouped = true;
        };
      };
      ui-select = {
        enable = true;
      };
      frecency = {
        enable = true;
      };
      fzf-native = {
        enable = true;
      };
    };
    settings = {
      pickers = {
        colorscheme = {
          enable_preview = true;
        };
      };
      mappings = {
        # This is not working, use Alt + the key instead 🤷
        n = {
          "d" = {
            __raw = "require('telescope.actions').delete_buffer";
          };
          "q" = {
            __raw = "require('telescope.actions').close";
          };
        };
      };
    };
    keymaps = {
      #  Files
      "<leader><space>" = {
        action = "find_files hidden=true";
        options = {
          desc = "Find project files";
        };
      };
      "<leader>fo" = {
        action = "oldfiles";
        options = {
          desc = "Old files";
        };
      };
      "<leader>fE" = {
        action = "file_browser hidden=true";
        options = {
          desc = "Root dir files";
        };
      };
      "<leader>fe" = {
        options.desc = "Current dir files";
        action = "file_browser path=%:p:h select_buffer=true hidden=true";
      };
      "<leader>ff" = {
        action = "find_files path=%:p:h hidden=true";
        options.desc = "Search file cwd";
      };
      "<leader>fg" = {
        action = "git_files";
        options = {
          desc = "Search git files";
        };
      };

      # Buffer
      "<leader>b" = {
        action = "buffers";
        options.desc = "+buffer";
      };

      # Git
      "<leader>gc" = {
        action = "git_commits";
        options = {
          desc = "Commits";
        };
      };
      "<leader>gs" = {
        action = "git_status";
        options = {
          desc = "Status";
        };
      };

      # Search
      "<leader>ss" = {
        action = "live_grep";
        options.desc = "Search string";
      };
      "<leader>sS" = {
        action = "live_grep path=%:p:h";
        options.desc = "Search string in cwd";
      };
      "<leader>sg" = {
        mode = "n";
        action = "diagnostics bufnr=0";
        options = {
          desc = "Document diagnostics";
        };
      };
      "<leader>sa" = {
        action = "autocommands";
        options = {
          desc = "Auto Commands";
        };
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find";
        options = {
          desc = "Buffer";
        };
      };
      "<leader>sc" = {
        action = "command_history";
        options = {
          desc = "Command History";
        };
      };
      "<leader>sC" = {
        action = "commands";
        options = {
          desc = "Commands";
        };
      };
      "<leader>sD" = {
        action = "diagnostics";
        options = {
          desc = "Workspace diagnostics";
        };
      };
      "<leader>sh" = {
        action = "help_tags";
        options = {
          desc = "Help pages";
        };
      };
      "<leader>sH" = {
        action = "highlights";
        options = {
          desc = "Search Highlight Groups";
        };
      };
      "<leader>sM" = {
        action = "man_pages";
        options = {
          desc = "Man pages";
        };
      };
      "<leader>sm" = {
        action = "marks";
        options = {
          desc = "Jump to Mark";
        };
      };
      "<leader>so" = {
        action = "vim_options";
        options = {
          desc = "Options";
        };
      };
      "<leader>uC" = {
        action = "colorscheme";
        options = {
          desc = "Colorscheme preview";
        };
      };
    };
  };
}
