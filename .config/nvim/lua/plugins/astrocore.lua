-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Danny Dasilva's customizations ported from vim-plug + CoC config

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    -- Diagnostics configuration
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- Filetypes
    filetypes = {
      extension = {
        tsx = "typescriptreact",
        jsx = "typescriptreact",
      },
    },
    -- Vim options (ported from init.vim)
    options = {
      opt = {
        relativenumber = false, -- Keep absolute line numbers (original config)
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false, -- Don't wrap long lines
        tabstop = 4, -- 4 space tabs
        shiftwidth = 4,
        expandtab = true,
        scrolloff = 7, -- Keep 7 lines visible above/below cursor
        updatetime = 300, -- Faster completion
        hidden = true, -- Enable buffers
        termguicolors = true,
        splitbelow = true, -- New splits below
        splitright = true, -- New splits to the right
        exrc = true, -- Project-local .nvimrc
        secure = true,
        showcmd = true, -- Display keypress
        clipboard = "unnamedplus", -- System clipboard
        fillchars = { vert = "▏" },
      },
      g = {
        autoformat_enabled = true,
        python_highlight_all = 1,
      },
    },
    -- Custom autocmds (ported from init.vim)
    autocmds = {
      -- Auto-save on focus lost
      focus_lost_save = {
        {
          event = "FocusLost",
          pattern = "*",
          command = "silent! wa",
          desc = "Auto-save on focus lost",
        },
      },
      -- TSX/JSX filetype detection
      jsx_tsx_filetype = {
        {
          event = { "BufNewFile", "BufRead" },
          pattern = { "*.tsx", "*.jsx" },
          command = "set filetype=typescriptreact",
        },
      },
    },
    -- Keymappings (ported from init.vim)
    mappings = {
      -- Normal mode
      n = {
        -- Buffer navigation (Tab/S-Tab for next/prev buffer)
        ["<Tab>"] = { "<cmd>bnext<CR>", desc = "Next buffer" },
        ["<S-Tab>"] = { "<cmd>bprevious<CR>", desc = "Previous buffer" },

        -- Split navigation with Shift + hjkl
        ["<S-H>"] = { "<C-w>h", desc = "Move to left split" },
        ["<S-J>"] = { "<C-w>j", desc = "Move to bottom split" },
        ["<S-K>"] = { "<C-w>k", desc = "Move to top split" },
        ["<S-L>"] = { "<C-w>l", desc = "Move to right split" },

        -- Split swap with Ctrl + hjkl
        ["<C-H>"] = { "<C-w>H", desc = "Swap with left split" },
        ["<C-J>"] = { "<C-w>J", desc = "Swap with bottom split" },
        ["<C-K>"] = { "<C-w>K", desc = "Swap with top split" },
        ["<C-L>"] = { "<C-w>L", desc = "Swap with right split" },

        -- Split resize with Ctrl + arrows
        ["<C-Left>"] = { "<cmd>vertical resize +3<CR>", desc = "Increase width" },
        ["<C-Right>"] = { "<cmd>vertical resize -3<CR>", desc = "Decrease width" },
        ["<C-Up>"] = { "<cmd>resize +3<CR>", desc = "Increase height" },
        ["<C-Down>"] = { "<cmd>resize -3<CR>", desc = "Decrease height" },

        -- Window layout changes
        ["<Leader>th"] = { "<C-w>t<C-w>H", desc = "Change to horizontal split" },
        ["<Leader>tk"] = { "<C-w>t<C-w>K", desc = "Change to vertical split" },

        -- Close other windows
        ["<Leader>q"] = { "<C-w>o", desc = "Close other windows" },

        -- Terminal
        ["<Leader>tt"] = { "<cmd>vnew term://bash<CR>", desc = "Open terminal vsplit" },

        -- File explorer (use neo-tree)
        ["<C-b>"] = { "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },

        -- Telescope mappings
        ["<C-e>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
        ["<C-f>"] = { function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
        ["<Leader>g"] = { function() require("telescope.builtin").live_grep() end, desc = "Ripgrep search" },
        ["<Leader>sd"] = {
          function()
            require("telescope.builtin").live_grep({ additional_args = function() return { "-F" } end })
          end,
          desc = "Grep clipboard",
        },
        ["<Leader>sF"] = { function() require("telescope.builtin").grep_string() end, desc = "Grep string" },

        -- Replace mappings
        ["rw"] = { "viwpyiw", desc = "Replace word with yank" },
        ["rl"] = { 'Pl"_D', desc = "Replace to EOL with yank" },

        -- Clear search highlight with Enter
        ["<CR>"] = { "<cmd>noh<CR><CR>", desc = "Clear search highlight" },

        -- Copy filename to clipboard
        ["yf"] = { '<cmd>let @+=expand("%")<CR>', desc = "Copy filename to clipboard" },

        -- Yank to end of line
        ["<Leader>y"] = { "y$", desc = "Yank to end of line" },

        -- Select all
        ["<C-A>"] = { "ggVG", desc = "Select all" },

        -- Reload config
        ["<Leader>r"] = { "<cmd>source $MYVIMRC<CR>", desc = "Reload config" },

        -- Centered search navigation
        ["n"] = { "nzzzv", desc = "Next search result (centered)" },
        ["N"] = { "Nzzzv", desc = "Prev search result (centered)" },

        -- LSP mappings (AstroNvim defaults are good, but add references)
        ["<Leader>u"] = { function() vim.lsp.buf.references() end, desc = "Show references" },
        ["<Leader>rn"] = { function() vim.lsp.buf.rename() end, desc = "Rename symbol" },

        -- Debug mappings (nvim-dap)
        ["<Leader>dd"] = { function() require("dap").continue() end, desc = "Debug continue/start" },
        ["<Leader>de"] = { function() require("dap").terminate() end, desc = "Debug terminate" },
        ["<Leader>dc"] = { function() require("dap").continue() end, desc = "Debug continue" },
        ["<Leader>dt"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
        ["<Leader>dT"] = { function() require("dap").clear_breakpoints() end, desc = "Clear breakpoints" },
        ["<Leader>dk"] = { function() require("dap").restart() end, desc = "Debug restart" },
        ["<Leader>dh"] = { function() require("dap").step_out() end, desc = "Step out" },
        ["<Leader>dl"] = { function() require("dap").step_into() end, desc = "Step into" },
        ["<Leader>dj"] = { function() require("dap").step_over() end, desc = "Step over" },
        ["<Leader>du"] = { function() require("dapui").toggle() end, desc = "Toggle debug UI" },

        -- Test mappings (vim-test)
        ["<Leader>tn"] = { "<cmd>TestNearest<CR>", desc = "Test nearest" },
        ["<Leader>tf"] = { "<cmd>TestFile<CR>", desc = "Test file" },
        ["<Leader>ts"] = { "<cmd>TestSuite<CR>", desc = "Test suite" },
        ["<Leader>tl"] = { "<cmd>TestLast<CR>", desc = "Test last" },

        -- Text-to-speech (if you use this feature)
        -- ["<Leader>es"] = { function() vim.cmd("call tts#Speak()") end, desc = "Text to speech" },
      },

      -- Insert mode
      i = {
        -- Escape with kj
        ["kj"] = { "<Esc>", desc = "Escape" },

        -- Go to end of line
        ["<A-l>"] = { "<C-o>A", desc = "Go to end of line" },
      },

      -- Visual mode
      v = {
        -- Copy to system clipboard
        ["<C-c>"] = { '"*y :let @+=@*<CR>', desc = "Copy to clipboard" },

        -- Yank to end of line
        ["<Leader>y"] = { "y$", desc = "Yank to end of line" },
      },

      -- Command mode
      c = {
        -- Escape with kj
        ["kj"] = { "<C-C>", desc = "Escape" },
      },

      -- Terminal mode
      t = {
        -- Escape exits terminal
        ["<Esc>"] = { "<C-\\><C-n>", desc = "Exit terminal mode" },
      },
    },
  },
}
