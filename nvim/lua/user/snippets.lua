local ls = require"luasnip"
local fmt = require("luasnip.extras.fmt").fmt
local extras = require"luasnip.extras"
local rep = extras.rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

ls.add_snippets("all", {
	s("ternary", {
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	})
})

local js_snips = {
	  s("pu", fmt("console.log('🦄 - {}', {})", {i(1, "label"), rep(1)})),
	  s("pp", fmt("console.log('ℹ️  - {}', {})", {i(1, "label"), rep(1)})),
	  s("fn", fmt("({1}) => {{\n  return {2};\n}}", {i(1, "name"), i(2, "undefined")})),
	  s("tf", fmt("({1}: {2}) => {{\n  return {3};\n}}", {i(1, "name"), i(2, "any"), i(3, "undefined")})),
}

local firstUpper = function(index)
  return f(function(arg, snip)
    if arg[1][1] == nil then
      return nil
    end
    return (arg[1][1]:gsub("^%l", string.upper))
  end, { index })
end

local react_snips = {
 s("ust", fmt("const [{}, set{}] = useState{0}();", {i(1, "name"), firstUpper(1)})),
}

ls.add_snippets("javascript", js_snips)
ls.add_snippets("typescriptreact", react_snips)

require('luasnip').filetype_extend("javascript", { "typescriptreact" })
require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })
