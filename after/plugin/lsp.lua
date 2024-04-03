  local lsp_zero = require('lsp-zero')

  lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
  end)

  require('mason').setup({})
  require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'tsserver', 'rust_analyzer','csharp_ls','cssls','golangci_lint_ls','html', 'emmet_ls'},
    handlers = {
      lsp_zero.default_setup,
    },
  })

  local cmp = require('cmp')

  cmp.setup({
      mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({select = false}),
      }),
  })
