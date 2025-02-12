{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        # lsp formatting is disabled, it breakes formatting when multiple files, namely templ or sql, are open.
        lspFallback = false;
        timeoutMs = 500;
      };
      notify_on_error = true;
      formatters_by_ft =
        builtins.listToAttrs (
          map
            (ftype: {
              name = ftype;
              value = [
                "prettierd"
                "prettier"
              ];
            })
            [
              "html"
              "css"
              "javascript"
              "javascriptreact"
              "typescript"
              "typescriptreact"
              "markdown"
            ]
        )
        // {
          python = [ "black" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          yaml = [
            "yamllint"
            "yamlfmt"
          ];
          go = [
            "goimports"
            "gofmt"
          ];
          templ = [
            "templ"
          ];
          elixir = [
            "mix_format"
          ];
        };
    };
  };
}
