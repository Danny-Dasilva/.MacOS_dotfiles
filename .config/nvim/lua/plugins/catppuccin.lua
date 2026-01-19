-- Catppuccin colorscheme configuration
-- Ported from init.vim: let g:catppuccin_flavour = "macchiato"

---@type LazySpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Load before other plugins
  opts = {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = {
      light = "latte",
      dark = "macchiato",
    },
    transparent_background = false,
    term_colors = true,
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      treesitter = true,
      notify = true,
      mini = true,
      telescope = true,
      which_key = true,
      dap = true,
      dap_ui = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
    },
  },
}
