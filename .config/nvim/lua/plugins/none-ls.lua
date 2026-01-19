-- Customize None-ls sources (formatters and linters)
-- Ported from coc-settings.json formatting and linting config

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")

    -- Only insert new sources, do not replace the existing ones
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Formatters
      null_ls.builtins.formatting.black, -- Python
      null_ls.builtins.formatting.prettier.with({
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "json",
          "html",
          "css",
        },
      }),
      null_ls.builtins.formatting.goimports, -- Go
      null_ls.builtins.formatting.stylua, -- Lua

      -- Linters/Diagnostics
      null_ls.builtins.diagnostics.mypy, -- Python type checking
      null_ls.builtins.diagnostics.flake8.with({
        extra_args = { "--max-line-length=120", "--ignore=E501,W503" },
      }),
      null_ls.builtins.diagnostics.eslint_d, -- JavaScript/TypeScript
    })
  end,
}
