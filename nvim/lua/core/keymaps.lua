local keymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Arama vurgusunu temizle
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true })

-- Dosya kaydet / çık (silent vermemek çıktıyı ve hataları görmek için daha iyidir)
keymap("n", "<leader>w", "<cmd>w<CR>")
keymap("n", "<leader>q", "<cmd>q<CR>")

-- Panoyu bozmadan yapıştır
keymap("x", "<leader>p", [["_dP]])

-- Sayfa kaydırırken imleci ortala
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Arama sonuçlarında gezinirken ortala
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Seçili satırları yukarı/aşağı taşı
keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Pencere bölme ve yönetimi
keymap("n", "<leader>sv", "<C-w>v")
keymap("n", "<leader>sh", "<C-w>s")
keymap("n", "<leader>se", "<C-w>=")
keymap("n", "<leader>sx", "<cmd>close<CR>")

-- Teşhis mesajı (diagnostic)
keymap("n", "gl", vim.diagnostic.open_float)
