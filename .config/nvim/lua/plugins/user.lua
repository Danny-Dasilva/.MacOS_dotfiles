-- Additional user plugins
-- Danny Dasilva's extra plugins ported from vim-plug config

---@type LazySpec
return {
  -- Telescope with fzf-native for faster sorting (ported from init.vim)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
  },

  -- Git integration (vim-fugitive was in original config)
  "tpope/vim-fugitive",

  -- LuaSnip filetype extensions (JavaScript/TypeScript)
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require("astronvim.plugins.configs.luasnip")(plugin, opts)
      local luasnip = require("luasnip")
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      luasnip.filetype_extend("typescript", { "typescriptreact" })
    end,
  },

  -- Gdiffoff command (ported from init.vim custom command)
  {
    "tpope/vim-fugitive",
    config = function()
      vim.api.nvim_create_user_command("Gdiffoff", function()
        vim.cmd("diffoff | q | Gedit")
      end, {})
    end,
  },
}
