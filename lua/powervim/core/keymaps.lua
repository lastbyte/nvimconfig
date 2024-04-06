vim.g.mapleader = " "

P = function(f)
  vim.print(vim.inspect(f))
  return f
end

local keymap = vim.keymap -- for conciseness

-- Neovim
keymap.set("n", "<esc>", "<cmd>nohl<cr>")
keymap.set("n", "<C-q>", "<cmd>qa!<CR>", { desc = "Close Neovim" })
keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<CR><ESC>", { desc = "Save Changes" })
keymap.set("i", "jk", "<ESC>", { desc = "go to normal mode" })

-- disable updating register for x and c
keymap.set("n", "x", '"_x')
keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')

-- window management
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Change window to right" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Change window to left" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Change window to bottom" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Change window to top" })
keymap.set("n", "<C-x>", "<cmd>close<CR>", { desc = "Close current split" })

-- tab navigation
keymap.set({ "n", "i", "v" }, "<tab>", "<cmd>BufferNext<cr>", { desc = "go to next buffer" })
keymap.set({ "n", "i", "v" }, "<S-tab>", "<cmd>BufferPrevious<cr>", { desc = "go to previous buffer" })
keymap.set({ "n" }, "<leader>x", "<cmd>BufferClose<cr>", { desc = "close current buffer" })

-- splits management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

keymap.set("n", "D", "d$", { desc = "delete to end of line" })
keymap.set("x", "Y", "y$", { desc = "Yank to end of line" })

-- moving blocks up and down
keymap.set("v", "<C-g>", "<cmd>m .+1<CR>gv=gv", { desc = "Move text down" })
keymap.set("v", "<C-t>", "<cmd>m .-2<CR>gv=gv", { desc = "Move text up" })

-- jumping between issues
keymap.set("n", "<A-d>", "<cmd>silent cc | silent cn<cr>zz", { desc = "Jump to next issue" })
keymap.set("n", "<A-s>", "<cmd>silent cc | silent cp<cr>zz", { desc = "Jump to previous issue" })

-- other
keymap.set("n", "<leader>mm", "<cmd>messages<cr>", { desc = "Show messages" })
keymap.set("n", "}", '<cmd>execute "keepjumps norm! }"<cr>', { desc = "Next Paragraph" })
keymap.set("n", "{", '<cmd>execute "keepjumps norm! {"<cr>', { desc = "Previous Paragraph" })

-- theme
keymap.set("n", "<leader>th", "<cmd>Telescope colorscheme<cr>", { desc = "Switch themes" })

-- browse project
keymap.set(
  "n",
  "<leader>gd",
  "<cmd>Telescope lsp_definitions <cr>",
  { desc = "go to definition", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>gD",
  "<cmd>Telescope lsp_type_definitions <cr>",
  { desc = "go to type definitions", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>gi",
  "<cmd>Telescope lsp_implementations <cr>",
  { desc = "go to implementation", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>gr",
  "<cmd>Telescope lsp_references <cr>",
  { desc = "go to references", noremap = true, silent = true }
)

-- diagnostics
-- Lua
keymap.set(
  "n",
  "<leader>dn",
  "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
  { noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>dp",
  "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",
  { noremap = true, silent = true }
)
keymap.set("n", "<leader>da", "<cmd>Telescope diagnostics<cr>", { noremap = true, silent = true })

-- git
keymap.set(
  "n",
  "<leader>gc",
  "<cmd>Telescope git_commits<cr>",
  { desc = "git commits", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>gb",
  "<cmd>Telescope git_branches<cr>",
  { desc = "git commits", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>gs",
  "<cmd>Telescope git_status<cr>",
  { desc = "git commits", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>gt",
  "<cmd>Telescope git_stash<cr>",
  { desc = "git commits", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>gh",
  "<cmd>Telescope git_bcommits<cr>",
  { desc = "git history for the file", noremap = true, silent = true }
)
keymap.set(
  "v",
  "<leader>gh",
  "<cmd>Telescope git_bcommits_range<cr>",
  { desc = "git history for the selection", noremap = true, silent = true }
)

-- search
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Live grep in cwd" })
keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", { desc = "find the word under cursor" })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "list files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "find files in git" })
-- search for symbols
keymap.set(
  "n",
  "<leader>ws",
  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
  { desc = "find the symbols across project" }
)

-- terminal
keymap.set(
  "n",
  "<leader>h",
  "<cmd>ToggleTerm direction=horizontal name=SHELL<cr>",
  { desc = "open a horizontal terminal" }
)
keymap.set(
  "n",
  "<leader>v",
  "<cmd>ToggleTerm direction=vertical size=50 name=SHELL<cr>",
  { desc = "open a vertical terminal" }
)
keymap.set({ "n", "i", "t" }, "<C-t>", "<cmd>ToggleTermToggleAll<cr>", { desc = "toggle terminal" })
