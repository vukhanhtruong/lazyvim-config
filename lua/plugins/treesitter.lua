return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- keep parsers up to date
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
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
        "python",
        -- remove this if you don't know you need it:
        -- "embedded_template",
      },

      auto_install = true,
      ignore_install = {}, -- <-- not { "" }
      sync_install = false,

      highlight = {
        enable = true,
        disable = { "css" }, -- keep if you really need to disable
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
      -- Backward+forward compatible require:
      local ok, mod = pcall(require, "nvim-treesitter.configs")
      if not ok then
        -- fallback for older plugin versions
        mod = require("nvim-treesitter.config")
      end
      mod.setup(opts)

      -- OPTIONAL: if you use textobjects in your mini.lua, ensure the module exists
      -- and won't error when the plugin isn't installed for a language.
      -- local has_to, _ = pcall(require, "nvim-treesitter.textobjects.move")
      -- if has_to then
      --   require("nvim-treesitter.configs").setup({
      --     textobjects = { select = { enable = true }, move = { enable = true } },
      --   })
      -- end
    end,
    -- config = function(_, opts)
    --   require("nvim-treesitter.config").setup(opts)
    -- end,
  },
}
