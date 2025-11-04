return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  enable = true,
  opts = {
    -- Настройки, специфичные для typescript-tools
    settings = {
      -- Улучшает производительность, запуская проверку ошибок в отдельном процессе
      separate_diagnostic_server = true,

      -- Проверять ошибки только после выхода из режима вставки (insert mode)
      publish_diagnostic_on = "insert_leave",

      -- Включить автоматическое закрытие JSX/TSX тегов.
      -- Отключите, если используете nvim-ts-autotag или у вас возникают конфликты.
      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact" },
      },

      -- Включить автодополнение вызовов функций (например, `func(` вместо `func`)
      complete_function_calls = true,

      -- Добавление плагинов, если они нужны (например, для styled-components)
      -- tsserver_plugins = { "typescript-styled-plugin" },

      -- Ограничение памяти для tsserver
      tsserver_max_memory = "auto",

      -- Указываем, что нужно выставлять как Code Actions
      expose_as_code_action = {
        "fix_all",
        "add_missing_imports",
        "remove_unused",
        "remove_unused_imports",
        "organize_imports",
      },
    },

    -- Функция, которая выполняется после подключения LSP к буферу
    on_attach = function(client, bufnr)
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on vim.lsp functions
      local buf_set_keymap = vim.api.nvim_buf_set_keymap
      local opts = { noremap = true, silent = true }

      buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

      -- Обратите внимание: typescript-tools.nvim предоставляет свои команды
      -- <leader>ca обычно вызывает встроенные LSP code_action
      buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

      -- Дополнительные биндинги typescript-tools, если они вам нужны
      -- buf_set_keymap(bufnr, "n", "<leader>tsr", "<cmd>TSToolsRenameFile<CR>", opts)
      -- buf_set_keymap(bufnr, "n", "<leader>tse", "<cmd>TSToolsGetSupportedCodeFixes<CR>", opts)
    end,
  },
}
