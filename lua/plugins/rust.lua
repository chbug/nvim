return {
	{
	  'neovim/nvim-lspconfig',
	  config = function()
            require('lspconfig').rust_analyzer.setup{
		experimental = {
    		  serverStatusNotification = true
  		}
	    }
	  end
	},
	-- Provides latest version number and completion for
	-- crates in Cargo.toml.
        {
            'saecki/crates.nvim',
            tag = 'stable',
            config = function()
                require('crates').setup{
		  lsp = {
                    enabled = true,
                    actions = true,
                    completion = true,
                    hover = true,
                  },
		  completion = {
		    crates = {
                      enabled = true,
                      max_results = 8,
                      min_chars = 3,
                    },
		  },
		}
            end,
        },
	-- Helper for getting quickfix while not using :make
	-- as it logs to a separate window. Example:
	-- :AsyncRun cargo test
	{ 'skywind3000/asyncrun.vim' },
}
