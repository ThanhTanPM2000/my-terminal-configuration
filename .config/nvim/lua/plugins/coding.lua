return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "mlaursen/vim-react-snippets",
  },
  opts = function(_, opts)
    local cmp = require("cmp")
    require("vim-react-snippets").lazy_load()
    opts.mapping = cmp.mapping.preset.insert({
      -- ["<C-k>"] = cmp.mapping.select_prev_item(), -- changed from <C-n> to <C-k>
      -- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<M-`>"] = cmp.mapping.complete(), -- show completion suggestions
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
    })
    return opts
  end,
}
