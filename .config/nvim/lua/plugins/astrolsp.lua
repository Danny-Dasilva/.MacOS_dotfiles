-- AstroLSP configuration
-- Danny Dasilva's LSP settings ported from CoC.nvim

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      codelens = true,
      inlay_hints = true, -- Enable inlay hints (was using pyright inlay hints)
      semantic_tokens = true,
    },
    -- Customize lsp formatting options
    formatting = {
      -- Control auto formatting on save
      format_on_save = {
        enabled = true, -- Enable format on save globally (was coc.preferences.formatOnSave)
        allow_filetypes = {
          "python",
          "typescript",
          "javascript",
          "typescriptreact",
          "javascriptreact",
          "json",
          "go",
          "html",
          "css",
        },
      },
      disabled = {
        -- Disable lua_ls formatting if you want to use StyLua
        "lua_ls",
      },
      timeout_ms = 3000, -- Increased timeout for larger files
    },
    -- Enable servers that you already have installed without mason
    servers = {},
    -- Customize language server configuration options passed to `lspconfig`
    config = {
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
          pyright = {
            -- Enable inlay hints (ported from coc-settings.json)
            inlayHints = {
              functionReturnTypes = true,
              variableTypes = true,
            },
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      },
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
      -- Go auto-organize imports on save (ported from init.vim)
      go_organize_imports = {
        cond = function(client) return client.name == "gopls" end,
        {
          event = "BufWritePre",
          desc = "Organize Go imports on save",
          callback = function()
            local params = vim.lsp.util.make_range_params()
            params.context = { only = { "source.organizeImports" } }
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
            for _, res in pairs(result or {}) do
              for _, r in pairs(res.result or {}) do
                if r.edit then
                  vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
                elseif r.command then
                  vim.lsp.buf.execute_command(r.command)
                end
              end
            end
          end,
        },
      },
    },
    -- Mappings to be set up on attaching of a language server
    mappings = {
      n = {
        -- Declaration
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        -- Documentation hover (ported from <C-k><C-i>)
        ["<C-k><C-i>"] = {
          function() vim.lsp.buf.hover() end,
          desc = "Hover documentation",
        },
        -- Toggle semantic tokens
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
        -- Symbol navigation (ported from <A-n> and <A-b>)
        ["<A-n>"] = {
          function() vim.lsp.buf.document_highlight() end,
          desc = "Highlight symbol references",
        },
      },
    },
    -- A custom `on_attach` function
    on_attach = function(client, bufnr)
      -- Highlight symbol under cursor (ported from CursorHold autocmd)
      if client.supports_method "textDocument/documentHighlight" then
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = bufnr,
          callback = function() vim.lsp.buf.document_highlight() end,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = bufnr,
          callback = function() vim.lsp.buf.clear_references() end,
        })
      end
    end,
  },
}
