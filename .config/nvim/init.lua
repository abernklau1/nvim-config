-- disable netrw at the very start of your init.lua (strongly advised) ** For nvim-tree **
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("plugins")

-- Space as leader
vim.g.mapleader = " "

-- lsp config
require("lsp")



-- lsp_signature.nvim
lsp_signature_cfg = {
  hint_prefix = "",
  floating_window = false
}

require "lsp_signature".setup(lsp_signature_cfg)

-- lualine
require("lualine").setup()

-- nvim-treesitter
require("nvim-treesitter.configs").setup{
  highlight = {
    enable = true,
  },
}

require("nvim-autopairs").setup()

-- colorscheme
-- vim.g.gruvbox_contrast_dark="medium"
-- vim.g.gruvbox_contrast_light = "hard"
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("highlight Normal ctermbg=NONE")
--[[ vim.cmd("highlight EndOfBuffer ctermfg=grey") ]]
vim.cmd("colorscheme tokyomidnight-midnight")



-- options
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.showtabline = 1
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.title = true
vim.opt.wrap = true
vim.opt.shiftwidth = 2

-- nvim-tree
require("nvim-tree").setup({
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {},
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- keymappings
  -- nvim-tree
  vim.api.nvim_set_keymap('n', "<leader>e", "<cmd>NvimTreeToggle<CR>", {})
