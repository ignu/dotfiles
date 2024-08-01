local status_ok, yanky = pcall(require, "yanky")
if not status_ok then
	return
end

yanky.setup({
	ring = {
		history_length = 50,
		storage = "shada",
		sync_with_numbered_registers = true,
	},
	system_clipboard = {
		sync_with_ring = false,
	},
})
