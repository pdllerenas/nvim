return {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- use latest stable
  build = "make install_jsregexp", -- optional, improves regex snippets
    config = function()
      local luasnip = require("luasnip")

      -- load snippets from ~/.config/nvim/lua/luasnippets/
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/luasnippets/" })

      luasnip.config.setup({
        update_events = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })

      -- Keymaps for jumping
      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if luasnip.jumpable(1) then
            return "<Plug>luasnip-jump-next"
        else
          return "<Tab>"
        end
      end, { expr = true, silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if luasnip.jumpable(-1) then
            return "<Plug>luasnip-jump-prev"
        else
          return "<S-Tab>"
        end
      end, { expr = true, silent = true })
    end,
}

