return {
  'saghen/blink.cmp',
  dependencies = {
    'saghen/blink.lib',
  },
  -- Önceden derlenmiş hazır ikili dosyaları (pre-built binary) çeker:
  version = '*',
  opts = {
    keymap = {
      preset = 'none',

      -- Manuel açma / kapatma
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>']     = { 'hide' },

      -- Tab ile onaylama
      ['<Tab>']     = { 'accept', 'fallback' },

      -- Menü açıkken j ve k ile gezinme; menü kapalıyken normal harf yazma
      ['j']         = { 'select_next', 'fallback' },
      ['k']         = { 'select_prev', 'fallback' },

      -- Alternatif olarak Ctrl+n / Ctrl+p veya Yön Tuşları yedeği
      ['<Down>']    = { 'select_next', 'fallback' },
      ['<Up>']      = { 'select_prev', 'fallback' },

      -- Dokümantasyon penceresini kaydırma
      ['<C-b>']     = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>']     = { 'scroll_documentation_down', 'fallback' },
    },

    completion = {
      trigger = {
        -- Otomatik açılmaları kapat (sadece <C-space> ile manuel tetiklenir)
        show_on_keyword = false,
        show_on_trigger_character = false,
        show_in_snippet = false,
      },
      menu = {
        auto_show = false,
      },
    },
  },
}
