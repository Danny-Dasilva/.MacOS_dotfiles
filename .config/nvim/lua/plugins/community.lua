-- AstroCommunity language packs and plugins
-- These provide pre-configured language support with best practices

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Language packs (replaces CoC extensions)
  { import = "astrocommunity.pack.python" }, -- pyright, ruff, black, debugpy
  { import = "astrocommunity.pack.typescript" }, -- tsserver, prettier, eslint
  { import = "astrocommunity.pack.go" }, -- gopls, goimports
  { import = "astrocommunity.pack.json" }, -- jsonls
  { import = "astrocommunity.pack.html-css" }, -- html, cssls, emmet

  -- Catppuccin colorscheme (ported from init.vim)
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- Additional utilities
  { import = "astrocommunity.motion.flash-nvim" }, -- Better motion (like vim-sneak)
  { import = "astrocommunity.editing-support.todo-comments-nvim" }, -- Highlight TODOs
}
