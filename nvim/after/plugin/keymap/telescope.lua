vim.keymap.set('n', '<leader>ff', function()
    require('telescope.builtin').find_files()
end)

vim.keymap.set('n', '<leader>fg', function()
    require('telescope.builtin').live_grep()
end)

vim.keymap.set('n', '<leader>,', function()
    require('telescope.builtin').buffers()
end)

vim.keymap.set('n', '<leader>fs', function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >")})
end)

vim.keymap.set('n', '<leader>fh', function()
    require('telescope.builtin').help_tags()
end)
