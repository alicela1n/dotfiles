vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.lazy")
require("config.treesitter")

vim.filetype.add({
	extension = {
		ebnf = "ebnf",
	},
})

require("lazy").setup({
	install = { colorscheme = { "fluoromachine", "maxmx03" } },
	{
		"maxmx03/fluoromachine.nvim",
		lazy = false,
		priority = 1000,
		config = function()
		local fm = require("fluoromachine")

		fm.setup({
			glow = true,
			theme = "fluoromachine",
			transparent = true,
		})

		vim.cmd.colorscheme("fluoromachine")
		end,
  	},
	{
		"tpope/vim-sleuth",
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		cond = not vim.g.neovide,
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
				},
				sections = {
					lualine_b = {
						"branch",
						"diff",
						"diagnostics",
					},
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				on_attach = function(bufnr)
					vim.api.nvim_buf_set_keymap(bufnr, 'n', ']h', '<cmd>lua require"gitsigns".nav_hunk("next")<CR>', {})
					vim.api.nvim_buf_set_keymap(bufnr, 'n', '[h', '<cmd>lua require"gitsigns".nav_hunk("prev")<CR>', {})
					vim.api.nvim_buf_set_keymap(bufnr, 'n', ']H', '<cmd>lua require"gitsigns".nav_hunk("last")<CR>', {})
					vim.api.nvim_buf_set_keymap(bufnr, 'n', '[H', '<cmd>lua require"gitsigns".nav_hunk("first")<CR>', {})
				end
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					themable = false,
					show_close_icon = false,
					separator_style = "slant",
					tab_size = 0,
					diagnostics = "nvim_lsp",
					hover = {
						enabled = true,
						delay = 0,
						reveal = { "close" },
					},
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
							separator = true,
						},
					},
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				xml = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				cpp = { "clang-format " },
				cs = { "csharpier" },
			},
			-- Set up format-on-save
			--format_on_save = { timeout_ms = 500, lsp_fallback = true },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						assist = {
							importMergeBehavior = "module"
						}
					}
				}
			})
			-- Setup language servers.
			vim.lsp.enable("clangd")
			vim.lsp.enable("csharp_ls")
			vim.lsp.enable("gdscript")
			vim.lsp.enable("pyright")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("slangd")
			vim.lsp.enable("ts_ls")

			-- Global mappings.
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
			-- mini.bracketed
			-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

			local group = vim.api.nvim_create_augroup("UserLspConfig", {})

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = group,
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

					vim.lsp.codelens.enable(true, { bufnr = ev.buf })
					vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
				end,
			})
		end,
	},
	{
		"romus204/tree-sitter-manager.nvim",
		cond = vim.fn.executable("tree-sitter") == 1,
		config = function()
			require("tree-sitter-manager").setup({
				ensure_installed = treesitter_languages,
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				render = "wrapped-compact",
				top_down = false,
				max_width = 50,
				max_height = 10,
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				update_focused_file = {
					enable = true,
				},
				filters = {
					custom = {
						"\\.uid$",
					},
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",
		-- snippets collection
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "enter" },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = false } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },

			-- experimental feature to show function signature as popup
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim" },
		},
		keys = {
			--{ "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>', desc = "find files" },
			--{ "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>', desc = "live grep" },
			{ "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>', desc = "buffers" },
			{ "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>', desc = "help tags" },
			--{ "<leader>fr", '<cmd>lua require("telescope.builtin").resume()<cr>', desc = "resume last" },
			{ "<leader>fo", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', desc = "file outline" },
		},
		config = function()
			require("telescope").setup({})

			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-mini/mini.align",
		version = "*",
		config = function()
			require("mini.align").setup({})
		end,
	},
	{
		-- toggle comments with `gc`, e.g. `gcc`, `gcip`
		"nvim-mini/mini.comment",
		version = "*",
	},
	{
		"nvim-mini/mini.bracketed",
		version = "*",
		config = function()
			-- Buffer                   [B [b ]b ]B  MiniBracketed.buffer()
			-- Comment block            [C [c ]c ]C  MiniBracketed.comment()
			-- Conflict marker          [X [x ]x ]X  MiniBracketed.conflict()
			-- Diagnostic               [D [d ]d ]D  MiniBracketed.diagnostic()
			-- File on disk             [F [f ]f ]F  MiniBracketed.file()
			-- Indent change            [I [i ]i ]I  MiniBracketed.indent()
			-- Jumplist in current buf  [J [j ]j ]J  MiniBracketed.jump()
			-- Location from loc list   [L [l ]l ]L  MiniBracketed.location()
			-- Old files                [O [o ]o ]O  MiniBracketed.oldfile()
			-- Quickfix                 [Q [q ]q ]Q  MiniBracketed.quickfix()
			-- Tree-sitter node         [T [t ]t ]T  MiniBracketed.treesitter()
			-- Undo states              [U [u ]u ]U  MiniBracketed.undo()
			-- Window in current tab    [W [w ]w ]W  MiniBracketed.window()
			-- Yank selection           [Y [y ]y ]Y  MiniBracketed.yank()
			require('mini.bracketed').setup()
		end,
	},
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "junegunn/fzf", "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({
				"telescope",
				keymap = {
					builtin = {
						["<M-p>"] = "toggle-preview",
					},
					fzf = {
						["tab"] = "down",
						["shift-tab"] = "up",
					},
				},
				--[[winopts = {
					border = "none",
					height = 0.95,
					width = 0.90,
					preview = {
						border = "none",
						hidden = "hidden",
					},
				},]]
				defaults = {
					git_icons = false,
					file_icons = true,
				},
				live_grep = {
					rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --max-count=10000 -e",
				},
				previewers = {
					builtin = {
						treesitter = {
							enabled = vim.fn.has("win64") == 0 and treesitter_languages or false,
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>ff", ":FzfLua files<cr>", { silent = true, desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>fg", ":FzfLua grep<cr>", { silent = true, desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>fr", ":FzfLua live_grep_resume<cr>", { silent = true, desc = "Resume search" })
		end,
	},
	{
		"andythigpen/nvim-coverage",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("coverage").setup({
				highlights = {
					covered = { fg = "#083b7a" },
					uncovered = { fg = "#ffef0a" },
				},
			})
		end,
	},
	{
		"ojroques/nvim-bufdel",
		cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
		keys = {
			{ "<leader>bc", "<cmd>BufDel<cr>", desc = "[B]uffer: [C]lose current" },
			{ "<leader>bn", "<cmd>bn<cr>", desc = "[B]uffer: [N]ext" },
			{ "<leader>bp", "<cmd>bp<cr>", desc = "[B]uffer: [P]revious" },
			{ "<leader>bo", "<cmd>BufDelOthers<cr>", desc = "[B]uffer: there can only be [O]ne (delete all [O]thers)" },
		},
	},
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
