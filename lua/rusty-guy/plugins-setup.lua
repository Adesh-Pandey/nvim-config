vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- Autocommand that reloads neovim whenever you save to this file

local status, lazy = pcall(require, "lazy")
if not status then
	return
end

return lazy.setup({

	"bluz71/vim-nightfly-guicolors", -- theme
	"christoomey/vim-tmux-navigator", -- to navigate between split window
	"szw/vim-maximizer", -- toggle size of split window

	"tpope/vim-surround", -- wrap with characters
	"vim-scripts/ReplaceWithRegister", -- replace by coping

	"numToStr/Comment.nvim", -- commenting

	"nvim-tree/nvim-tree.lua", -- explorer
	"kyazdani42/nvim-web-devicons", -- icons

	-- fuzzy finding w/ telescope
	{ "nvim-telescope/telescope.nvim", dependencies = { "tsakirist/telescope-lazy.nvim", "nvim-lua/plenary.nvim" } },
	-- autocompletion
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths

	-- snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocomple  "rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	}, -- in charge of managing lsp servers, linters & formatters

	-- configuring lsp servers
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion

	-- need to set this uo
	{ "simrat39/rust-tools.nvim", ft = "rust", opts = function() end },
	"hrsh7th/nvim-cmp",
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	-- LSP completion source:
	"hrsh7th/cmp-nvim-lsp",

	-- Useful completion sources:
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/vim-vsnip",
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}, -- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side

	"nvim-lualine/lualine.nvim",
	require("rusty-guy.plugins.formatting"),
})
