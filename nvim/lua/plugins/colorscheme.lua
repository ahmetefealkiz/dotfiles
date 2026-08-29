return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                compile = false,
                undercurl = true,
                commentStyle = { italic = true },
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                transparent = true, -- Şeffaf arka planı aktif et
                dimInactive = false,
                terminalColors = true,
                theme = "wave",     -- veya "dragon" / "lotus"
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        -- Teleskop pencerelerini de şeffaf ve şık yap
                        TelescopeNormal = { bg = "none" },
                        TelescopeBorder = { bg = "none" },
                        TelescopePromptNormal = { bg = "none" },
                        TelescopePromptBorder = { bg = "none" },
                        TelescopeResultsNormal = { bg = "none" },
                        TelescopeResultsBorder = { bg = "none" },
                        TelescopePreviewNormal = { bg = "none" },
                        TelescopePreviewBorder = { bg = "none" },

                        -- Floating pencereler (LSP hover 'K' vb.)
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },

                        -- Kenar boşlukları ve satır numaraları
                        SignColumn = { bg = "none" },
                        LineNr = { bg = "none" },
                        CursorLineNr = { bg = "none" },
                    }
                end,
            })

            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },
}
