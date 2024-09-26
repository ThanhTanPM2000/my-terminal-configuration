if vim.g.vscode then
  -- VSCode extension
  vim.cmd("source " .. vim.fn.expand("~/.config/nvim/vscode/settings.vim"))
end

require("config.lazy")
