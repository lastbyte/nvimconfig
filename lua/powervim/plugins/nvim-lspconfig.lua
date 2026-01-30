return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = vim.lsp.config
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities.offsetEncoding = { "utf-16" }
    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show line diagnostics"
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "Show documentation for what is under cursor"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end

    local on_init = function(client, _)
      if client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end

    -- lspconfig["sourcekit"].setup({
    --   cmd = { '/usr/bin/sourcekit-lsp' },
    --   pattern = { "c", "h", "hpp", "cpp" },
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   on_init = on_init
    -- })

    -- c/c++
    -- lspconfig.ccls.setup {
    --
    -- }
    vim.lsp.enable("pyright")

    -- Enable the vtsls language server
    vim.lsp.enable("vtsls", {
      -- Optional: Add custom settings here. These settings are similar to
      -- VS Code's TypeScript extension settings.
      settings = {
        -- Example settings for inlay hints and function call completion
        typescript = {
          inlayHints = {
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            variableTypes = { enabled = true },
          },
          suggest = {
            completeFunctionCalls = true,
          },
        },
        javascript = {
          -- same as typescript settings if needed
        },
        vtsls = {
          -- Automatically use the workspace's TypeScript version if available
          autoUseWorkspaceTsdk = true,
        },
      },
      -- Other lspconfig options can go here, like on_attach function
      -- on_attach = function(client, bufnr)
      --    -- keymaps or other setups
      -- end,
    })

    vim.lsp.config("clangd", {
      pattern = { "c", "h", "hpp", "cpp" },
      capabilities = capabilities,
      on_attach = on_attach,
      on_init = on_init,
    })

    -- lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      on_init = on_init,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- go
    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })

    -- css
    vim.lsp.config("cssls", {})

    --html
    vim.lsp.config("html", {})

    --python
    vim.lsp.config("pyright", {})

    -- nice icons
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end,
}
