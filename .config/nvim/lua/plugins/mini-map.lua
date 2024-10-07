return {
  "echasnovski/mini.map",
  config = function()
    local mini_map = require("mini.map")

    -- Define the path to persist the mini_map_state
    local state_file = vim.fn.stdpath("data") .. "/mini_map_state"

    -- Function to save the mini_map_state
    local function save_mini_map_state()
      local state = vim.g.mini_map_state and "true" or "false"
      local file = io.open(state_file, "w")
      if file then
        file:write(state)
        file:close()
      end
    end

    -- Function to load the mini_map_state
    local function load_mini_map_state()
      local file = io.open(state_file, "r")
      if file then
        local state = file:read("*all")
        file:close()
        return state == "true"
      end
      return nil
    end

    -- Toggle MiniMap using LazyVim keymap
    LazyVim.toggle.map("<leader>mu", {
      name = "Toggle MiniMap",
      get = function()
        return vim.g.mini_map_state or false
      end,
      set = function(state)
        if state then
          vim.g.mini_map_state = true
          mini_map.open()
        else
          vim.g.mini_map_state = false
          mini_map.close()
        end
        -- Save the state whenever it changes
        save_mini_map_state()
      end,
    })

    -- Setup mini_map with integrations
    mini_map.setup({
      integrations = {
        mini_map.gen_integration.builtin_search(),
        mini_map.gen_integration.diff(),
        mini_map.gen_integration.diagnostic(),
      },
    })

    -- Load the state when Neovim starts
    vim.g.mini_map_state = load_mini_map_state()

    -- Open or close the minimap based on the loaded state
    if vim.g.mini_map_state == nil or vim.g.mini_map_state == true then
      vim.g.mini_map_state = true
      mini_map.open()
    else
      mini_map.close()
    end

    -- Save the state when Neovim exits
    vim.api.nvim_create_autocmd("VimLeave", {
      callback = save_mini_map_state,
    })
  end,
}
