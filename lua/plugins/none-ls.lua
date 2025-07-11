return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local helpers = require("null-ls.helpers")

    local clang_tidy = {
          method = null_ls.methods.DIAGNOSTICS,
          filetypes = { "c", "cpp" },
        generator = null_ls.generator({
            command = "/usr/bin/clang-tidy",
            args = { "$FILENAME", "--quiet", "--", "std=c++17", "-I./include"},
            to_stdin = false,
            from_stderr = true,
            format = "line",
            check_exit_code = function(code) return code <= 1 end,
            on_output = helpers.diagnostics.from_patterns({
                {
                    pattern = "([^:]+):(%d+):(%d+): (%w+): (.+)",
                    groups = { "filename", "row", "col", "severity", "message" },
                },
            }),
        }),
    }
    null_ls.setup({
      debug = true,
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format.with({
          command = "/usr/bin/clang-format",
          extra_args = { "--style=file" }
        }),
        clang_tidy,
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
