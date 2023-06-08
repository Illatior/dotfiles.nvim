local status, _ = pcall(vim.cmd, "colorscheme onedark")
if not status then
    print("colorscheme not found")
end
