
return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    }
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      
      -- Carregar snippets do VSCode
      luasnip.filetype_extend("javascriptreact", {"html"})
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- REQUIRED - você deve especificar um mecanismo de snippet
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Usando LuaSnip corretamente
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar o item atualmente selecionado
        }),
        sources = cmp.config.sources({
          { name = 'luasnip' }, -- Usando LuaSnip
        }, {
          { name = "buffer" },
        }),
      })
    end,
  }
}

