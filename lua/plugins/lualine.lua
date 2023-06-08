local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local lualine_onedark = require("lualine.themes.onedark")
lualine.setup({
    options = {
        section_separatos = '',
        component_separators = '',
        theme = lualine_onedark,
        icons_enabled = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'filename', file_status = true, path = 1 } },
        lualine_c = { 'branch' },
        lualine_d = { 'lsp_progress' },

        lualine_x = {
            'fileformat',
            {
                'diagnostics', sources = { 'nvim_diagnostic' }, sections = { 'error', 'warn', 'info', 'hint' }
            }
        },
        lualine_y = { 'filetype', 'lsp' },
        lualine_z = { 'location' },
    },
})
