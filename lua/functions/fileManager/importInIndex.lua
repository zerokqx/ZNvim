local M = {}

function M.importInIndex()
  local current = vim.fn.expand("%:t")
  if current ~= "index.ts" and current ~= "index.tsx" then
    print("⚠️  Этот файл не index.ts или index.tsx")
    return
  end

  local dir = vim.fn.expand("%:p:h")
  local ts_files = vim.fn.globpath(dir, "*.{ts,tsx}", false, true)
  local entries = vim.fn.readdir(dir)

  local exports = {}

  -- Добавляем экспорт из файлов ts/tsx кроме текущего index.ts(x)
  for _, file in ipairs(ts_files) do
    local name = vim.fn.fnamemodify(file, ":t")
    if name ~= "index.ts" and name ~= "index.tsx" then
      local basename = name:gsub("%.tsx?$", "")
      table.insert(exports, string.format([[export * from "./%s";]], basename))
    end
  end

  -- Проверяем папки, если в них есть index.ts или index.tsx - добавляем экспорт
  for _, entry in ipairs(entries) do
    if vim.fn.isdirectory(dir .. "/" .. entry) == 1 then
      local index_ts = dir .. "/" .. entry .. "/index.ts"
      local index_tsx = dir .. "/" .. entry .. "/index.tsx"
      if vim.fn.filereadable(index_ts) == 1 or vim.fn.filereadable(index_tsx) == 1 then
        table.insert(exports, string.format([[export * from "./%s";]], entry))
      end
    end
  end

  -- Записываем экспорты в начало буфера
  vim.api.nvim_buf_set_lines(0, 0, -1, false, exports)
  print("✅ Экспорты сгенерированы.")
end
return M
