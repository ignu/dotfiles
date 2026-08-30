local status_ok, bqf = pcall(require, "bqf")
if not status_ok then
	return
end

bqf.setup({})
