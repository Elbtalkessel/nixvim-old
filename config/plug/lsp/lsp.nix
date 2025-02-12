{
  plugins = {
    lsp-format = {
      # Doesn't work with templ, esp css / js in templ
      enable = false;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        html = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        nixd = {
          # Error executing vim.schedule lua callback: ....10.2/share/nvim/runtime/lua/vim/lsp/semantic_tokens.lua:0: ....10.2/share/nvim/runtime/lua/vim/lsp/semantic_tokens.lua:0: index out of range
          enable = false;
          extraOptions = {
            nixos = {
              expr = "(builtins.getFlake \"/etc/nixos\").nixosConfigurations.aurelionite.options";
            };
            home_manager = {
              expr = "(builtins.getFlake \"/etc/nixos\").homeConfigurations.aurelionite.options";
            };
          };
        };
        marksman = {
          enable = true;
        };
        pyright = {
          enable = true;
        };
        gopls = {
          enable = true;
        };
        yamlls = {
          enable = true;
        };
        templ = {
          enable = true;
        };
        htmx = {
          enable = true;
        };
        sqls = {
          enable = true;
        };
        tailwindcss = {
          enable = true;
        };
        nushell = {
          enable = true;
        };
        elixirls = {
          enable = true;
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
