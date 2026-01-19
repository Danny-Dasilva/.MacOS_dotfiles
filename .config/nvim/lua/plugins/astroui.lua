-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Danny Dasilva's UI customizations

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- Use Catppuccin colorscheme (ported from init.vim)
    colorscheme = "catppuccin",
    -- Highlight customizations
    highlights = {
      init = {
        -- Italic comments (ported from init.vim)
        Comment = { italic = true },
      },
    },
    -- Icons configuration
    icons = {
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
