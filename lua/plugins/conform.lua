local Lsp = require("utils.lsp")

return {
  {
    "stevearc/conform.nvim",
    optional = true,
    keys = {
      { "<leader>cn", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
    },
    opts = {
      formatters_by_ft = {
        fish = {},
        go = { "goimports", "gofmt" },
        python = { "ruff_fix", "ruff_format" },
        php = { "pint" },
        rust = { "rustfmt" },
        -- ❌ Remove nested brackets
        yaml = { "prettierd", "prettier", "dprint" },
        ["markdown"] = { "prettierd", "prettier", "dprint" },
        ["markdown.mdx"] = { "prettierd", "prettier", "dprint" },
        ["javascript"] = { "deno_fmt", "prettierd", "prettier", "biome", "dprint" },
        ["javascriptreact"] = { "rustywind", "deno_fmt", "prettierd", "prettier", "biome", "dprint" },
        ["typescript"] = { "deno_fmt", "prettierd", "prettier", "biome", "dprint" },
        ["typescriptreact"] = { "rustywind", "deno_fmt", "prettierd", "prettier", "biome", "dprint" },
        ["svelte"] = { "rustywind", "deno_fmt", "prettierd", "prettier", "biome", "dprint" },
      },
      -- ✅ Use stop_after_first instead of nested brackets
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
        stop_after_first = true,
      },
      formatters = {
        biome = {
          condition = function()
            local path = Lsp.biome_config_path()
            local is_nvim = path and string.match(path, "nvim")
            return path and not is_nvim
          end,
        },
        deno_fmt = {
          condition = function()
            return Lsp.deno_config_exist()
          end,
        },
        dprint = {
          condition = function()
            return Lsp.dprint_config_exist()
          end,
        },
        prettier = {
          condition = function()
            local path = Lsp.biome_config_path()
            local is_nvim = path and string.match(path, "nvim")
            return not (path and not is_nvim)
          end,
        },
        prettierd = {
          condition = function()
            local path = Lsp.biome_config_path()
            local is_nvim = path and string.match(path, "nvim")
            return not (path and not is_nvim)
          end,
        },
      },
    },
  },
}
