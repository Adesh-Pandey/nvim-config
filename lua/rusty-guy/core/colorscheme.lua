local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("no colorscheme found")
	return
end
