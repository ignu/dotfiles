local dap = require("dap")

require("dap-vscode-js").setup({
	adapters = {
			'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal',
			'pwa-extensionHost'
	}
})


-- dap.adapters.node2 = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { os.getenv("HOME") .. "/bin/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
-- }

dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = {
			os.getenv('HOME') ..
					'/.local/share/nvim/site/pack/packer/opt/vscode-node-debug2/out/src/nodeDebug.js'
	}
}
dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}


dap.defaults.fallback.terminal_win_cmd = '20split new'
vim.fn.sign_define('DapBreakpoint',
                   {text = '🟥', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected',
                   {text = '🟦', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',
                   {text = '⭐️', texthl = '', linehl = '', numhl = ''})

vim.keymap.set('n', '<leader>dh',
               function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dH',
               ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<A-k>', function() require"dap".step_out() end)
vim.keymap.set('n', "<F11>", function() require"dap".step_into() end)
vim.keymap.set('n', '<F10>', function() require"dap".step_over() end)
vim.keymap.set('n', '<F5>', function() require"dap".continue() end)
vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>dc', function() require"dap".terminate() end)
vim.keymap.set('n', '<leader>dR',
               function() require"dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>de',
               function() require"dap".set_exception_breakpoints({"all"}) end)
vim.keymap.set('n', '<leader>da', function() require"debugHelper".attach() end)
vim.keymap.set('n', '<leader>dA',
               function() require"debugHelper".attachToRemote() end)
vim.keymap
    .set('n', '<leader>di', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>d?', function()
    local widgets = require "dap.ui.widgets";
    widgets.centered_float(widgets.scopes)
end)
vim.keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>dr',
               ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
vim.keymap.set('n', '<leader>du', ':lua require"dapui".toggle()<CR>')

require('nvim-dap-virtual-text').setup()