local M = { name = "Mini-files" }
function M.miniFilesRoot()
  local miniF = require("mini.files")
  local path = vim.fn.getcwd()
  miniF.open(path)
end

function M.miniFilesRelative()
  local miniF = require("mini.files")
  local path = vim.fn.getcwd(-1, -1)
  miniF.open(path)
end
return M
