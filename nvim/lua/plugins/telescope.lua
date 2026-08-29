return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "truncate" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- Önceki sonuca git
                        ["<C-j>"] = actions.move_selection_next,     -- Sonraki sonuca git
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        -- Fzf eklentisini yükle (hızlandırma için)
        pcall(telescope.load_extension, "fzf")

        -- Kısayollar
        local keymap = vim.keymap.set
        local opts = { noremap = true, silent = true, desc = "" }

        opts.desc = "Dosya ara (Fuzzy Find)"
        keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)

        opts.desc = "Proje genelinde metin ara (Live Grep)"
        keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)

        opts.desc = "Açık buffer'lar arasında ara"
        keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

        opts.desc = "Son aramalara / yardım etiketlerine bak"
        keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
    end,
}
