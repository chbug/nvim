return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('lspconfig').rust_analyzer.setup{
                settings = {
                    ['rust-analyzer'] = {
                        rust = {
                            -- Workaround for rust-analyzer messing up the build cache
                            -- Without it, more dependencies get recompiled at every
                            -- change.
                            analyzerTargetDir = true
                        }
                    }
                },
                experimental = {
                    serverStatusNotification = true
                },
            }

            vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action)
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
            vim.keymap.set('n', '<leader>f', vim.lsp.buf.references)
            vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
            vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
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
    { 'tpope/vim-fugitive' },
}
