return {
  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        -- formatters
        "prettier",
        "prettierd",
        -- code spell
        "codespell",
        "misspell",
        "cspell",
        -- markdown
        "markdownlint",
        -- rustywind for tailwindcss
        "rustywind",
        -- php
        "pint",
        -- typescript
        "typescript-language-server",
        -- prisma ls
        "prisma-language-server",
        -- helm ls
        "helm-ls",
        -- nginx
        "nginx-language-server",
        -- yaml
        "yamllint",
        "yamlfmt",
        "yamlfix",
      },
    },
  },
}
