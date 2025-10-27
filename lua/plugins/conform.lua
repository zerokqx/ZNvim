return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufWritePre", "BufReadPost", "BufNewFile" },
  opts = {
    default_format_opts = {
      timeout_ms = 3000,
      async = false,
      quiet = false,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      python = { "black" },
      nix = { "nixfmt" },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
    },
  },
}
