-- Mason configuration for tool installation
-- Ported from CoC extensions list

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "pyright",
        "typescript-language-server",
        "gopls",
        "json-lsp",
        "html-lsp",
        "css-lsp",
        "emmet-language-server",

        -- Formatters (ported from coc-settings.json)
        "black", -- Python formatter
        "prettier", -- JS/TS/JSON/HTML/CSS formatter
        "goimports", -- Go imports organizer
        "stylua", -- Lua formatter

        -- Linters (ported from coc-settings.json)
        "mypy", -- Python type checker
        "flake8", -- Python linter
        "eslint_d", -- JavaScript/TypeScript linter

        -- Debug adapters
        "debugpy", -- Python debugger
        "node-debug2-adapter", -- Node.js debugger

        -- Other
        "tree-sitter-cli",
      },
    },
  },
}
