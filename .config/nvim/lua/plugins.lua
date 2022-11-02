local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", '1', "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "luochen1990/rainbow"
  use "tpope/vim-surround"
  -- use "tpope/vim-commentary"
  -- use "tpope/vim-dispatch"
  use "neovim/nvim-lspconfig"
  use "ray-x/lsp_signature.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "sbdchd/neoformat"
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  use "ntpeters/vim-better-whitespace"
  use "windwp/nvim-autopairs"
  use "tpope/vim-fugitive"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  -- vim.cmd("colorscheme tokyomidnight-midnight")
  use "abernklau1/tokyomidnight"
  use "wakatime/vim-wakatime"
  if packer_bootstrap then
    require("packer").sync()
  end
end
)
