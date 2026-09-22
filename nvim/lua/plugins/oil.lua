return {
  'stevearc/oil.nvim',
  lazy = false, -- Netrw'nin yerini hemen alması için açılışta yüklenir
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- opsiyonel: dosya ikonları için
  opts = {
    -- Netrw'yi tamamen kapatıp varsayılan yapar (nvim . dediğinde Oil açılır)
    default_file_explorer = true,
    -- Gizli dosyaları (nokta ile başlayan) görmek istersen:
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    -- Hangi dosyada olursan ol '-' tuşuna basınca o dosyanın bulunduğu klasörü açar
    { "-", "<cmd>Oil<cr>", desc = "Bulunulan dizini aç (Oil)" },
  },
}
