local function lsp_client_names()
  local msg = 'No LSP'
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  if next(clients) == nil then
    return msg
  end

  local names = {}
  for _, client in pairs(clients) do
    if client.name ~= "GitHub Copilot" then -- skip GitHub Copilot
      table.insert(names, client.name)
    end
  end

  if #names == 0 then
    return msg
  end

  return table.concat(names, " ")
end

require('lualine').setup({
  sections = {
    lualine_x = { lsp_client_names }, -- put our custom function here
  },
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
        'buffers',
    },
    lualine_x = {lsp_client_names, 'fileformat', 'filetype'},
    lualine_y = {''},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
