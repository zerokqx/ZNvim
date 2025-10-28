return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- tsserver = {
      --   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      --   enabled = true,
      -- },
      rust_analyzer = {
        filetypes = { "rust" },
      },
      nil_ls = {
        filetypes = { "nix" },
      },
      -- Для SQL может потребоваться отдельный LSP-сервер, например, `sqlls` или `efm-langserver` с `sql-language-server`
      -- Если вы используете `sqlls` через `mason`, его можно включить здесь.
      -- sqlls = {
      --   filetypes = { "sql" }, -- Убедитесь, что это правильный filetype для ваших SQL-файлов
      -- },

      -- Отключаем fsautocomplete, так как он не нужен и вызывает ошибку установки
      fsautocomplete = { enabled = false },

      -- Пример отключения неиспользуемых LSP-серверов
      -- Вы можете добавить сюда серверы, которые вам не нужны
      -- pyright = { enabled = false },
      -- go_ls = { enabled = false },
      -- jdtls = { enabled = false },
      bashls = {
        filetypes = { "bash", "sh" },
      },
    },
    -- Общие настройки для LSP-серверов
    setup = {
      tsserver = function(_, opts)
        -- Оптимизация для tsserver
        opts.init_options = vim.tbl_deep_extend("force", opts.init_options or {}, {
          preferences = {
            disableSuggestions = true,
            maxNodeModuleJsDepth = 2,
            allowLargeWorkspaceDependencies = true,
          },
        })
        opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
          typescript = {
            tsserver = {
              maxTsServerMemory = 8192, -- Увеличиваем память tsserver до 8GB
            },
          },
        })
        return true
      end,
    },
  },
  lazy = true,
}
