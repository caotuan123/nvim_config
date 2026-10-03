return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("illuminate").configure({
            providers = { "lsp" },
            delay = 250,
            modes_allowlist = { "n" },
            disable_keymaps = true,
            large_file_cutoff = 10000,
        })

        local function set_highlights()
            local background = vim.o.background == "light" and "#bfd7f2" or "#465b78"
            for _, group in ipairs({ "IlluminatedWordText", "IlluminatedWordRead", "IlluminatedWordWrite" }) do
                vim.api.nvim_set_hl(0, group, { bg = background })
            end
        end

        vim.api.nvim_create_autocmd("ColorScheme", {
            group = vim.api.nvim_create_augroup("ReferenceHighlights", { clear = true }),
            callback = set_highlights,
        })
        set_highlights()
    end,
}
