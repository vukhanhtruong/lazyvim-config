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
        "stylelint",
        -- code spell
        "codespell",
        "misspell",
        "cspell",
        -- markdown
        "markdownlint",
        -- rustywind for tailwindcss
        "rustywind",
        -- node-debug
        "node-debug2-adapter",
        -- js
        "js-debug-adapter",
        "standardjs",
        -- typescript
        "typescript-language-server",
        "ts-standard",
        -- prisma ls
        "prisma-language-server",
        -- sql ls
        "sqlls",
        -- helm ls
        "helm-ls",
        -- nginx
        "nginx-language-server",
        -- docker
        "docker-compose-language-service",
        "dockerfile-language-server",
        -- sonarlint
        "sonarlint-language-server",
        -- yaml
        "yamllint",
        "yamlfmt",
      },
    },
  },
}
