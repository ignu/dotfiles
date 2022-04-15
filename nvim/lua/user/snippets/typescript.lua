return {
	s("pu", fmt("console.log('🦄 - {}', {})", { i(1, "label"), rep(1) })),
	s("pp", fmt("console.log('ℹ️  - {}', {})", { i(1, "label"), rep(1) })),
	s("fn", fmt("({1}) => {{\n  return {2};\n}}", { i(1, "name"), i(2, "undefined") })),
	s("tf", fmt("({1}: {2}) => {{\n  return {3};\n}}", { i(1, "name"), i(2, "any"), i(3, "undefined") })),
}