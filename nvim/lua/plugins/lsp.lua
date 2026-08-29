return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        -- 1. Mason Kurulumu
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- 2. Kurulmasını istediğiniz LSP Sunucuları
        local servers = {
            "clangd",      -- C / C++
            "pyright",     -- Python
            "lua_ls",      -- Lua
            "bashls",      -- Bash
            "ts_ls",       -- TypeScript / JavaScript
        }

        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_installation = true,
        })

        -- 3. Blink.cmp LSP Yetenekleri
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- 4. LSP Genel Tuş Atamaları (LspAttach)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Tanıma git"
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

                opts.desc = "Dokümantasyonu göster"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Referansları listele"
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

                opts.desc = "Kod eylemleri (Code Action)"
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Yeniden adlandır (Rename)"
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Sonraki hata/uyarıya git"
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                opts.desc = "Önceki hata/uyarıya git"
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            end,
        })

        -- 5. Modern vim.lsp.config API ile Sunucuları Yapılandırma ve Aktif Etme
        for _, server in ipairs(servers) do
            local config = {
                capabilities = capabilities,
            }

            -- Lua için özel Neovim API tanıması
            if server == "lua_ls" then
                config.settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                }
            end

            -- Modern API: vim.lsp.config & vim.lsp.enable
            vim.lsp.config[server] = config
            vim.lsp.enable(server)
        end
    end,
}
