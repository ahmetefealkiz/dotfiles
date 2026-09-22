return {
  "Diogo-ss/42-header.nvim",
  lazy = false, -- Açılışta hemen yüklenmesini sağlar
  init = function()
    -- Eklenti yüklenmeden önce bu değişkenleri zorla atar
    vim.g.user42 = "aalkiz"
    vim.g.mail42 = "aalkiz@student.42istanbul.com.tr"
  end,
  opts = {
    default_map = false,
    auto_update = true,
    user = "aalkiz",
    mail = "aalkiz@student.42istanbul.com.tr",
  },
  config = function(_, opts)
    require("42header").setup(opts)
  end,
}
