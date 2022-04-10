local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
 [[____   ___.___   _____                                      .___   ]],
 [[\   \ /   |   | /     \ _____________  _______  __ ____   __| _/   ]],
 [[ \   Y   /|   |/  \ /  \\____ \_  __ \/  _ \  \/ _/ __ \ / __ |    ]],
 [[  \     / |   /    Y    |  |_> |  | \(  <_> \   /\  ___// /_/ |    ]],
 [[   \___/  |___\____|__  |   __/|__|   \____/ \_/  \___  \____ |    ]],
 [[                      \/|__|                          \/     \/    ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/bin/dotfiles/nvim/luaoptions.lua <CR>"),
	dashboard.button("k", "  Keymaps", ":e ~/bin/dotfiles/nvim/lua/keymaps.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "--- ---"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
