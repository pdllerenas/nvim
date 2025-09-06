return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",   -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false,                      -- neo-tree will lazily load itself
  opts = {
    filesystem = {
      bind_to_cwd = false, -- don't auto-sync, we'll handle it manually
      follow_current_file = { enabled = true },
      window = {
        mappings = {
          ["C"] = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" then
              -- Change cwd to the selected directory
              vim.cmd("cd " .. node.path)
              require("neo-tree.sources.filesystem").navigate(state, node.path)
            else
              -- Open files as usual
              require("neo-tree.sources.filesystem.commands").open(state)
            end
          end,
        },
      },
    },
  }
}
