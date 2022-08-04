return require('packer').startup(function(use)
   	-- Packer can manage itself
   	use("wbthomason/packer.nvim")

   	-- Telescope
   	use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
   	use("nvim-telescope/telescope.nvim")

   	-- Status Line
   	use {
    	'nvim-lualine/lualine.nvim',
       	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
   	}

   	-- Tree sitter
   	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate"
   	}) 

	-- LSP
   	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
  	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
  	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
  	use("L3MON4D3/LuaSnip") -- Snippets plugin	
   	use("tzachar/cmp-tabnine", { run = "./install.sh" })
	use("onsails/lspkind-nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")

    -- tmux
    use("aserowy/tmux.nvim")

    -- File tree
    use{"kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly" -- optional, updated every week. (see issue #1193)
    }

    -- Undo tree
    use("mbbill/undotree")

    -- Project management
    use("ahmedkhalf/project.nvim")

    -- Comments 
    use("numToStr/Comment.nvim")

    -- Funzyyyyy
    use("RRethy/vim-illuminate")
    
    -- Multiedit
    use("terryma/vim-multiple-cursors")
	
    -- Themes
   	use("NTBBloodbath/doom-one.nvim") 
   	use("ellisonleao/gruvbox.nvim")
    use("navarasu/onedark.nvim")
end)
