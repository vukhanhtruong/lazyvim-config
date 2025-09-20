return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",                -- keep parsers up to date
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      ensure_installed = {
        "bash",
        "regex",
        "vim",
        "lua",
        "html",
        "markdown",
        "markdown_inline",
        "css",
        "typescript",
        "tsx",
        "javascript",
        "hurl",
        "json",
        "json5",
        "jsonc",
        "graphql",
        "prisma",
        "rust",
        "go",
        "toml",
        "c",
        "proto",
        "svelte",
        "astro",
        -- remove this if you don't know you need it:
        -- "embedded_template",
      },

      auto_install = true,
      ignore_install = {},              -- <-- not { "" }
      sync_install = false,

      highlight = {
        enable = true,
        disable = { "css" },            -- keep if you really need to disable
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true, disable = { "css" } },
      autopairs = { enable = true },

      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },

      autotag = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.config").setup(opts)
    end,
  },
}
