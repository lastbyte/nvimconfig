vim.g.mapleader = " "

P = function(f)
  vim.print(vim.inspect(f))
  return f
end

local keymap = vim.keymap -- for conciseness

-- Neovim
keymap.set("n", "<C-Q>", ":qa!<CR>", { desc = "Close Neovim", noremap = true, silent = true })
keymap.set({ "n", "i" }, "<C-s>", "<cmd>w<CR><ESC>", { desc = "Save Changes", noremap = true, silent = true })
keymap.set("i", "jk", "<ESC>", { desc = "go to normal mode", noremap = true, silent = true })
keymap.set("n", "<C-a>", "gg^vG$", { desc = "go to normal mode", noremap = true, silent = true })

vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })

-- disable updating register for x and c
keymap.set("n", "x", '"_x')
keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')

-- move between cursors
keymap.set("n", "<leader>.", "<C-i>", { desc = "next cursor position", noremap = true, silent = true })
keymap.set("n", "<leader>,", "<C-o>", { desc = "prev cursor position", noremap = true, silent = true })

-- window management
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Change window to right", noremap = true, silent = true })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Change window to left", noremap = true, silent = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Change window to bottom", noremap = true, silent = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Change window to top", noremap = true, silent = true })
keymap.set("n", "<C-q>", "<cmd>close<CR>", { desc = "Close current split", noremap = true, silent = true })

-- tab navigation
keymap.set({ "n", "v" }, "=", "<cmd>bn<cr>", { desc = "go to next buffer", noremap = true, silent = true })
keymap.set(
  { "n", "v" },
  "-",
  "<cmd>bp<cr>",
  { desc = "go to previous buffer", noremap = true, silent = true }
)
keymap.set({ "n" }, "<C-w>", "<cmd>bd!<cr>", { desc = "close current buffer", noremap = true, silent = true })

-- splits management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically", noremap = true, silent = true })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally", noremap = true, silent = true })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size", noremap = true, silent = true })
keymap.set("n", "<leader>e", ":Neotree toggle <cr>", { desc = "toggle tree", noremap = true, silent = true })

keymap.set("n", "D", "d$", { desc = "delete to end of line", noremap = true, silent = true })
keymap.set("x", "Y", "y$", { desc = "Yank to end of line", noremap = true, silent = true })

-- moving blocks up and down
keymap.set("v", "<C-g>", "<cmd>m .+1<CR>gv=gv", { desc = "Move text down", noremap = true, silent = true })
keymap.set("v", "<C-t>", "<cmd>m .-2<CR>gv=gv", { desc = "Move text up", noremap = true, silent = true })

-- jumping between issues
keymap.set(
  "n",
  "<A-d>",
  "<cmd>silent cc | silent cn<cr>zz",
  { desc = "Jump to next issue", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<A-s>",
  "<cmd>silent cc | silent cp<cr>zz",
  { desc = "Jump to previous issue", noremap = true, silent = true }
)

-- other
keymap.set("n", "<leader>mm", "<cmd>messages<cr>", { desc = "Show messages", noremap = true, silent = true })
keymap.set(
  "n",
  "}",
  '<cmd>execute "keepjumps norm! }"<cr>',
  { desc = "Next Paragraph", noremap = true, silent = true }
)
keymap.set(
  "n",
  "{",
  '<cmd>execute "keepjumps norm! {"<cr>',
  { desc = "Previous Paragraph", noremap = true, silent = true }
)

-- theme
keymap.set(
  "n",
  "<leader>th",
  "<cmd>Telescope colorscheme<cr>",
  { desc = "Switch themes", noremap = true, silent = true }
)

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
keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", { noremap = true, silent = true })
keymap.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { noremap = true, silent = true })
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
  "<leader>gl",
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
keymap.set(
  "n",
  "<leader>gb",
  "<cmd>Gitsigns blame_line<cr>",
  { desc = "git history for the selection", noremap = true, silent = true }
)

keymap.set("n", "<space>fb", function()
  require("telescope").extensions.file_browser.file_browser()
end, { noremap = true, silent = true, desc = "file browser" })
-- search
keymap.set(
  "n",
  "<leader>fw",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>fs",
  "<cmd>lua require('telescope.builtin').grep_string()<cr>",
  { noremap = true, silent = true, desc = "find the word under cursor" }
)
keymap.set(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<cr>",
  { noremap = true, silent = true, desc = "list files" }
)
keymap.set(
  "n",
  "<leader>fg",
  "<cmd>Telescope git_files<cr>",
  { noremap = true, silent = true, desc = "find files in git" }
)
-- search for symbols
keymap.set(
  "n",
  "<leader>sw",
  "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>",
  { noremap = true, silent = true, desc = "find the symbols across project" }
)
keymap.set(
  "n",
  "<leader>sf",
  "<cmd>lua require('telescope.builtin').treesitter()<cr>",
  { noremap = true, silent = true, desc = "find the symbols across project" }
)

-- terminal
keymap.set(
  "n",
  "<leader>h",
  "<cmd>ToggleTerm direction=horizontal name=SHELL<cr>",
  { noremap = true, silent = true, desc = "open a horizontal terminal" }
)
keymap.set(
  "n",
  "<leader>v",
  "<cmd>ToggleTerm direction=vertical size=50 name=SHELL<cr>",
  { noremap = true, silent = true, desc = "open a vertical terminal" }
)
keymap.set(
  { "n", "i", "t" },
  "<C-t>",
  "<cmd>ToggleTermToggleAll<cr>",
  { noremap = true, silent = true, desc = "toggle terminal" }
)
-- renamer
keymap.set("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
keymap.set("n", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
keymap.set("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

--dap
keymap.set(
  "n",
  "<leader>dk",
  '<cmd>lua require("dap").terminate()<cr>',
  { noremap = true, silent = true, desc = "start debugger on current file" }
)
--dap
keymap.set(
  "n",
  "<leader>do",
  '<cmd>lua require("dapui").open()<cr>',
  { noremap = true, silent = true, desc = "start debugger on current file" }
)
keymap.set(
  "n",
  "<leader>dc",
  '<cmd>lua require("dapui").close()<cr>',
  { noremap = true, silent = true, desc = "start debugger on current file" }
)

keymap.set(
  "n",
  "<F5>",
  "<cmd>lua require('dap').continue()<cr>",
  { noremap = true, silent = true, desc = "continue" }
)
keymap.set(
  "n",
  "<F10>",
  "<cmd>lua require('dap').step_over()<cr>",
  { noremap = true, silent = true, desc = "step over" }
)
keymap.set(
  "n",
  "<F11>",
  "<cmd>lua require('dap').step_into()<cr>",
  { noremap = true, silent = true, desc = "step into" }
)
keymap.set(
  "n",
  "<F12>",
  "<cmd>lua require('dap').step_out()<cr>",
  { noremap = true, silent = true, desc = "step out" }
)
keymap.set(
  "n",
  "<leader>db",
  "<cmd>lua require('dap').toggle_breakpoint()<cr>",
  { noremap = true, silent = true, desc = "toggle breakpoint" }
)

vim.keymap.set("n", "<M-C-n>", "<cmd>Scratch<cr>")
vim.keymap.set("n", "<M-C-o>", "<cmd>ScratchOpen<cr>")
