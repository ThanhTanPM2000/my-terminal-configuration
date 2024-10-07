return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = cmp.mapping.preset.insert({
      ["<M-`>"] = cmp.mapping.complete(), -- show completion suggestions
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
    })
    return opts
  end,
}
