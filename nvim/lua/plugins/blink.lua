return {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
        keymap = {
            preset = "default",
            -- Enter ile tamamlamayı onayla
            ["<CR>"] = { "accept", "fallback" },
            -- Tab / Shift-Tab ile listede gezin
            ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            -- Ctrl+Space ile listeyi manuel tetikle
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    opts_extend = { "sources.default" }
}
