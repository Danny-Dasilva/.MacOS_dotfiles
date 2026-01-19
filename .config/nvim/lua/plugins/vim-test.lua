-- vim-test configuration
-- Ported from init.vim test runner settings

---@type LazySpec
return {
  "vim-test/vim-test",
  keys = {
    { "<Leader>tn", "<cmd>TestNearest<CR>", desc = "Test nearest" },
    { "<Leader>tf", "<cmd>TestFile<CR>", desc = "Test file" },
    { "<Leader>ts", "<cmd>TestSuite<CR>", desc = "Test suite" },
    { "<Leader>tl", "<cmd>TestLast<CR>", desc = "Test last" },
  },
  config = function()
    -- Use neovim terminal for running tests
    vim.g["test#strategy"] = "neovim"
    vim.g["test#neovim#term_position"] = "vert"
  end,
}
