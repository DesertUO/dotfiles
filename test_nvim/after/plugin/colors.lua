function ColorMyPencils(color)
	color = color or "onedark_dark"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "signColumn", { bg="none" })

    vim.api.nvim_set_hl(0, "Visual", { bg = "#555555" })

	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

	vim.api.nvim_set_hl(0, "CursorLineNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNrNC", { bg="none", fg="#D3D3D3" })
    vim.api.nvim_set_hl(0, "LineNr", { bg="none", fg="#F0F0F0" })

    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg="none", fg="#FFFFFF" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg="none"})
    vim.api.nvim_set_hl(0, "TelescopeSelection", { bg="none", fg="#FF00FF" })

    vim.api.nvim_set_hl(0, "WinSeparator", { bg="none", fg="#7C70FF" })
end

ColorMyPencils()

