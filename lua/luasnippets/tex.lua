local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
  return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function() -- itemize environment detection
  return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
  return tex_utils.in_env("tikzpicture")
end

return {

  require("luasnip").snippet(
    {
      trig = "@cat",
      dscr = "for categories",
      wordTrig = false,
      priority = 1100,
      snippetType = "autosnippet",
    },
    fmta("\\textup{\\textsf{<>}}", {
      i(1),
    }) --     { condition = tex_utils.in_mathzone }
  ),

  require("luasnip").snippet(
    {
      trig = "@tt",
      dscr = "texttt",
      wordTrig = false,
      priority = 1100,
      snippetType = "autosnippet",
    },
    fmta("\\texttt{<>}", {
      i(1),
    })
  ),
}
