-- lua/branch-diff-search/init.lua
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

-- Function to get the current branch name
local function get_current_branch()
	local handle = io.popen("git branch --show-current")
	local result = handle:read("*a")
	handle:close()
	return result:gsub("\n", "")
end

-- Function to search for strings in branch but not in main
local function find_branch_specific_strings(opts)
	opts = opts or {}
	local search_term = opts.search_term or ""
	local branch = opts.branch or get_current_branch()

	-- Get files that are different between branch and main
	local diff_cmd = string.format("git diff main...%s --name-only", branch)
	local handle = io.popen(diff_cmd)
	local diff_files = handle:read("*a")
	handle:close()

	-- Search for the string in these files
	local results = {}
	for file in diff_files:gmatch("[^\r\n]+") do
		local grep_cmd = string.format("git grep -n '%s' %s:%s", search_term, branch, file)
		local grep_handle = io.popen(grep_cmd)
		local grep_result = grep_handle:read("*a")
		grep_handle:close()

		for line in grep_result:gmatch("[^\r\n]+") do
			local filename, line_num, content = line:match("([^:]+):(%d+):(.+)")
			if filename and line_num and content then
				table.insert(results, {
					filename = filename,
					line_num = tonumber(line_num),
					content = content,
				})
			end
		end
	end

	return results
end

function M.search_branch_differences(opts)
	opts = opts or {}

	pickers
		.new(opts, {
			prompt_title = "Branch-specific String Search",
			finder = finders.new_table({
				results = find_branch_specific_strings(opts),
				entry_maker = function(entry)
					return {
						value = entry,
						display = string.format("%s:%d: %s", entry.filename, entry.line_num, entry.content),
						ordinal = entry.filename .. entry.content,
						path = entry.filename,
						lnum = entry.line_num,
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)

					-- Open the file at the specific line
					vim.cmd(string.format("edit +%d %s", selection.lnum, selection.path))
				end)
				return true
			end,
		})
		:find()
end

-- Command to search in current branch
vim.api.nvim_create_user_command("BranchSearch", function(opts)
	M.search_branch_differences({
		search_term = opts.args,
	})
end, {
	nargs = 1,
	desc = "Search for strings in current branch that are not in main",
})

return M
