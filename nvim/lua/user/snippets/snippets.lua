-- local ls = require("luasnip")
-- local fmt = require("luasnip.extras.fmt").fmt
-- local extras = require("luasnip.extras")
-- local rep = extras.rep

-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node

-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")

-- local firstUpper = function(index)
-- 	return f(function(arg)
-- 		if arg[1][1] == nil then
-- 			return nil
-- 		end
-- 		return (arg[1][1]:gsub("^%l", string.upper))
-- 	end, { index })
-- end

-- local react_snips = {
-- 	s("ust", fmt("const [{}, set{}] = useState();", { i(1, "name"), firstUpper(1) })),
-- 	s("fc", fmt("() => {{\n\n\treturn(\t\t<{1}>\n\t\t\t{3}\n\t\t</{2}>\n\t)\n}};", { i(1, "div"), rep(1), i(2) })),
-- }

-- local ts_react_snips = {
-- 	s(
-- 		"ust",
-- 		fmt("const [{}, set{}] = useState<{}>({});", { i(1, "name"), firstUpper(1), i(2, "boolean"), i(3, "false") })
-- 	),
-- 	s("fc", fmt("() => {{\n\treturn(\n\t\t<{1}>\n\t\t\t{3}\n\t\t</{2}>\n\t)\n}};", { i(1, "div"), rep(1), i(2) })),
-- }

-- ls.add_snippets("javascript", js_snips)
-- ls.add_snippets("javascriptreact", react_snips)
-- ls.add_snippets("typescriptreact", ts_react_snips)

-- require("luasnip").filetype_extend("javascript", { "typescriptreact" })
-- require("luasnip").filetype_extend("javascript", { "javascriptreact" })
-- require("luasnip").filetype_extend("javascript", { "html" })
