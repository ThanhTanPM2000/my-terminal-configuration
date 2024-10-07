return {
  "echasnovski/mini.indentscope",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    symbol = "|",
    options = { try_as_border = true },
    draw = {
      animation = require("mini.indentscope").gen_animation.none(),
    },
  },
}
