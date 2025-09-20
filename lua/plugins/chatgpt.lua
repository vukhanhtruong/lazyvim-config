return {
  {
    "jackMort/ChatGPT.nvim",
    -- Not enabled if neovide
    enabled = not vim.g.neovide,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "echo -n " .. os.getenv("OPENAI_API_KEY"),
      })
    end,
  },
}
