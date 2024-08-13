-- require("catppuccin").setup({
-- 	flavour = "frappe", -- latte, frappe, macchiato, mocha
-- 	transparent_background = true, -- disables setting the background color.
-- 	dim_inactive = {
-- 		enabled = false, -- dims the background color of inactive window
-- 		shade = "dark",
-- 		percentage = 0.15, -- percentage of the shade to apply to the inactive window
-- 	},
-- })
--
-- vim.cmd.colorscheme("catppuccin")

function ColorMyPencils(color)
    color = color or "gruvbox-material"
    if color == "gruvbox-material" then
        vim.g.gruvbox_material_transparent_background = 2
        vim.g.gruvbox_material_dim_inactive_windows = 1
        vim.g.gruvbox_material_show_eob = 1
    end
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

require("catppuccin").setup({
    flavour = "frappe",     -- latte, frappe, macchiato, mocha
    transparent_background = true, -- disables setting the background color.
    dim_inactive = {
        enabled = false,   -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
})

ColorMyPencils("catppuccin")
