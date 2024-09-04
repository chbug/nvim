return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
        config = function()
          require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_symbols, {})
        vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})
        vim.keymap.set("n", "<space>fb", function()
	        require("telescope").extensions.file_browser.file_browser()
        end)
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
}
