local map = function(mode, key, result, noremap)
    if noremap == nil then
        noremap = true
    end
    vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = noremap, silent = true})
end

vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        vim.api.nvim_command("noautocmd :update")
    end
end
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
    vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
            -- Enable underline, use default values
            underline = true,
            -- Enable virtual text, override spacing to 4
            -- virtual_text = {
            --   spacing = 2,
            --   prefix = '~',
            -- },
            -- Use a function to dynamically turn signs off
            -- and on, using buffer local variables
            -- signs = function(bufnr, client_id)
            --   return vim.bo[bufnr].show_signs == false
            -- end,
            -- ■
            -- Disable a feature
            update_in_insert = false
        }
    )(...)
    vim.lsp.diagnostic.set_loclist({open_loclist = false})
end

local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
    end
    if client.resolved_capabilities.completion then
        require "completion".on_attach(client)
        map("i", "<c-j>", "<Plug>(completion_next_source)", false)
        map("i", "<c-k>", "<Plug>(completion_prev_source)", false)
        map("i", "<tab>", "<Plug>(completion_smart_tab)", false)
        map("i", "<s-tab>", "<Plug>(completion_smart_s_tab)", false)
        map("i", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", false)
    end
    if client.resolved_capabilities.hover then
        map("n", "<CR>", "<cmd>lua vim.lsp.buf.hover()<CR>")
    end
    if client.resolved_capabilities.rename then
        map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    end
end

require'lspconfig'.efm.setup{on_attach = on_attach}
require'lspconfig'.tsserver.setup{
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
}

-- require'lspconfig'.yamlls.setup{on_attach = on_attach}
