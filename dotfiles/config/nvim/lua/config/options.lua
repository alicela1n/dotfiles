-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- General
vim.opt.history = 500 -- Set history to 500
vim.opt.number = true -- Show line numbers
vim.opt.linebreak = true -- Prevent words from splitting across lines
vim.opt.showbreak = "+++" -- Show line breaks with +++
vim.opt.showmatch = true -- Highlight matching brace
vim.opt.ruler = true -- Show row and column ruler info
vim.opt.undolevels = 1000 -- Number of undo levels
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.wo.relativenumber = false -- Explicitly set to false

-- Searching
vim.opt.hlsearch = true -- Highlight all search results
vim.opt.smartcase = true -- Enable smart-case search
vim.opt.ignorecase = true -- Case insensitive searching
vim.opt.incsearch = true -- Search strings incrementally

-- Indenting
vim.opt.autoindent = true -- Auto indent new lines
vim.cmd("filetype plugin indent on")
vim.opt.smarttab = true
vim.opt.expandtab = false
vim.opt.indentexpr = ""

-- Key mappings
local nmap = function(lhs, rhs)
  vim.keymap.set("n", lhs, rhs, { silent = true })
end

-- Use meta-[hjkl] to select the active split
nmap("<M-k>", "<cmd>wincmd k<CR>")
nmap("<M-j>", "<cmd>wincmd j<CR>")
nmap("<M-h>", "<cmd>wincmd h<CR>")
nmap("<M-l>", "<cmd>wincmd l<CR>")

-- Open new window (horizontal)
nmap("<M-n>", "<cmd>new<CR>")
-- Split horizontally
nmap("<M-s>", "<cmd>split<CR>")
-- Split vertically
nmap("<M-S-s>", "<cmd>vsplit<CR>")
-- Open a terminal
nmap("<M-Return>", "<cmd>terminal<CR>")
-- NERDTree (or swap for nvim-tree if you use that instead)
nmap("<M-t>", "<cmd>NERDTree<CR>")
-- Swap panes with next window
nmap("<M-x>", "<C-w>x")
-- Reload config
nmap("<M-r>", "<cmd>source $HOME/.config/nvim/init.lua<CR>")
