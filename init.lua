-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Key mappings for vim-oscyank
-- Desc: yank to system clipboard
-- Usage: <leader>yy

vim.api.nvim_set_keymap("n", "<leader>y", "<Plug>OSCYank", {})
vim.api.nvim_set_keymap("v", "<leader>y", "<Plug>OSCYank", {})
