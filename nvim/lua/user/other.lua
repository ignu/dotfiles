require("other-nvim").setup({
	mappings = {
		{
			pattern = "/(.*)/(.*)/.*.ts$",
			target = "/%1/%2/%2.test.ts",
		},
	},
})
