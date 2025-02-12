_:
let
  get_bufnrs.__raw = ''
    function()
      local buf_size_limit = 1024 * 1024 -- 1MB size limit
      local bufs = vim.api.nvim_list_bufs()
      local valid_bufs = {}
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
          table.insert(valid_bufs, buf)
        end
      end
      return valid_bufs
    end
  '';
in
{
  plugins = {
    # completion plugin
    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        mapping = {
          "<C-d>" = # Lua
            "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = # Lua
            "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = # Lua
            "cmp.mapping.complete()";
          "<C-e>" = # Lua
            "cmp.mapping.close()";
          "<Tab>" = # Lua
            "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
          "<S-Tab>" = # Lua
            "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
          "<CR>" = # Lua
            "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
        };

        preselect = # Lua
          "cmp.PreselectMode.None";

        snippet.expand = # Lua
          "function(args) require('luasnip').lsp_expand(args.body) end";

        # Completion sources,
        # full list: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
        sources = [
          {
            # neovim's built-in language.
            name = "nvim_lsp";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            # shows function signatures.
            name = "nvim_lsp_signature_help";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            # Variables, classes, interfaces...
            name = "nvim_lsp_document_symbol";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            # Source code nodes.
            name = "treesitter";
            priority = 850;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            # Lua snippets.
            name = "luasnip";
            priority = 750;
          }
          {
            # From buffer.
            name = "buffer";
            priority = 500;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            # Ripgrep search results (from other files)
            name = "rg";
            priority = 300;
          }
          {
            # Filesystem paths.
            name = "path";
            priority = 300;
          }
          {
            # Vim's commandline completion.
            name = "cmdline";
            priority = 300;
          }
          {
            # Spelling suggestions.
            name = "spell";
            priority = 300;
          }
          {
            # Git source.
            name = "git";
            priority = 250;
          }
          {
            # Math expression evaluation results.
            name = "calc";
            priority = 150;
          }
        ];
      };
    };

    # Snippets collection for different languages.
    # https://github.com/rafamadriz/friendly-snippets
    friendly-snippets.enable = true;
    # Snippet engine.
    # https://github.com/L3MON4D3/LuaSnip
    luasnip.enable = true;

    # Adds icons to completition items.
    lspkind = {
      enable = true;

      cmp = {
        enable = true;

        menu = {
          buffer = "";
          calc = "";
          cmdline = "";
          codeium = "󱜙";
          emoji = "󰞅";
          git = "";
          luasnip = "󰩫";
          neorg = "";
          nvim_lsp = "";
          nvim_lua = "";
          path = "";
          spell = "";
          treesitter = "󰔱";
        };
      };
    };
  };
}
