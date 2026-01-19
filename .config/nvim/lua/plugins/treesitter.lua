-- Customize Treesitter
-- Ported from nvim-treesitter config

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- Languages from original config
      "lua",
      "vim",
      "vimdoc",
      "python",
      "typescript",
      "javascript",
      "tsx",
      "go",
      "json",
      "html",
      "css",
      "bash",
      "markdown",
      "markdown_inline",
      "yaml",
      "toml",
      "dockerfile",
      "gitignore",
      "regex",
    },
    -- Enable highlighting
    highlight = {
      enable = true,
    },
    -- Enable indentation
    indent = {
      enable = true,
    },
  },
}
