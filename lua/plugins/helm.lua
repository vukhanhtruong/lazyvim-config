return {
  -- Add the vim-helm plugin
  {
    "towolf/vim-helm",
    ft = "helm", -- Load only for Helm files
    config = function()
      -- Any additional configuration for the vim-helm plugin can go here
      -- For example, setting specific options or key mappings for Helm files
      vim.cmd([[ autocmd FileType helm setlocal shiftwidth=2 tabstop=2 ]])
    end,
  },
}
