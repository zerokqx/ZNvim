local M = {}

function M.RemovePropUnderCursor()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  -- Найти слово (имя пропса) под курсором
  local start_col = col + 1
  local s = start_col
  local e = start_col

  -- Расширяем влево по алфавиту/цифрам/_
  while s > 1 do
    local c = line:sub(s - 1, s - 1)
    if not c:match("[%w_]") then
      break
    end
    s = s - 1
  end
  -- Расширяем вправо
  while e <= #line do
    local c = line:sub(e, e)
    if not c:match("[%w_]") then
      break
    end
    e = e + 1
  end
  e = e - 1

  local propName = line:sub(s, e)
  if #propName == 0 then return end -- Если имя пропса не найдено, выходим

  local prop_start_idx = s -- Начало имени пропса

  -- Ищем '=' после имени пропса
  local eq_start, eq_end = line:find("%s*=%s*", e + 1)

  if eq_start then
    -- Пропс имеет значение
    local value_start_idx = eq_end + 1
    local value_end_idx = value_start_idx

    local first_char = line:sub(value_start_idx, value_start_idx)

    if first_char == "\"" or first_char == "'" then
      -- Значение в кавычках
      local quote_char = first_char
      local _, end_quote_idx = line:find(quote_char, value_start_idx + 1)
      if end_quote_idx then
        value_end_idx = end_quote_idx
      else
        -- Не найдена закрывающая кавычка, возможно, ошибка в коде или многострочная строка
        value_end_idx = #line -- Предполагаем, что значение до конца строки
      end
    elseif first_char == "{" then
      -- Значение в фигурных скобках, нужно найти балансирующую скобку
      local brace_count = 1
      value_end_idx = value_start_idx + 1
      while value_end_idx <= #line and brace_count > 0 do
        local char = line:sub(value_end_idx, value_end_idx)
        if char == "{" then
          brace_count = brace_count + 1
        elseif char == "}" then
          brace_count = brace_count - 1
        end
        value_end_idx = value_end_idx + 1
      end
      value_end_idx = value_end_idx - 1 -- Корректируем, чтобы указать на закрывающую скобку
    else
      -- Булев пропс или другое значение без кавычек/скобок (например, число)
      -- В этом случае, возможно, это просто имя пропса без явного значения
      -- или значение до следующего пробела/конца строки
      local next_space_or_tag = line:find("%s", value_start_idx)
      if next_space_or_tag then
        value_end_idx = next_space_or_tag - 1
      else
        value_end_idx = #line
      end
    end

    -- Теперь у нас есть prop_start_idx (начало имени пропса) и value_end_idx (конец значения пропса)
    -- Удаляем от начала имени пропса до конца значения, включая любые пробелы после
    local prop_full_end_idx = value_end_idx
    local _, trailing_space_end = line:find("^%s*", prop_full_end_idx + 1)
    if trailing_space_end then
      prop_full_end_idx = trailing_space_end
    end

    local old_prop_string = line:sub(prop_start_idx, prop_full_end_idx)
    local new_line_content = line:gsub(old_prop_string, "", 1) -- Удаляем только первое вхождение

    -- Очищаем лишние пробелы
    new_line_content = new_line_content:gsub("%s%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
    vim.api.nvim_set_current_line(new_line_content)

  else
    -- Булев пропс (только имя пропса без '=')
    local pattern_boolean = propName .. "%s*"
    local new_line_content = line:gsub(pattern_boolean, "", 1) -- Удаляем только первое вхождение

    -- Очищаем лишние пробелы
    new_line_content = new_line_content:gsub("%s%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
    vim.api.nvim_set_current_line(new_line_content)
  end
end
return M
