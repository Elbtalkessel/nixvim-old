{
  lib,
  config,
  ...
}:
let
  colors = import ../../../config/colors/${config.theme}.nix { };
in
{
  plugins.alpha = {
    enable = true;
    layout = [
      {
        type = "padding";
        val = 10;
      }
      {
        type = "group";
        val =
          let
            mkButton = shortcut: cmd: val: hl: {
              type = "button";
              inherit val;
              opts = {
                inherit hl shortcut;
                keymap = [
                  "n"
                  shortcut
                  cmd
                  { }
                ];
                position = "center";
                cursor = 0;
                width = 40;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            };
          in
          [
            (mkButton "f" "<CMD>lua require('telescope.builtin').find_files({ hidden = true })<CR>"
              "󰍉 Find File"
              "Operator"
            )
            (mkButton "g" "<CMD>LazyGit<CR>" " Open LazyGit" "Constant")
            (mkButton "q" "<CMD>qa<CR>" "󰚑 Quit Neovim" "String")
          ];
      }
      {
        type = "padding";
        val = 10;
      }
    ];
  };
  highlight = lib.mkIf config.plugins.alpha.enable {
    AlphaHeader = {
      fg = "${colors.base0D}";
    };
    AlphaFooter = {
      fg = "${colors.base0F}";
    };
  };
}
