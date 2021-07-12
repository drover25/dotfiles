local function nmap(key, cmd, opts) U.keymap.buf_map('n', key, cmd, opts) end
local function lua_nmap(key, cmd, opts)
    nmap(key, '<cmd>lua  ' .. cmd .. '<CR>', opts)
end

-- local function vmap(key, cmd, opts) U.keymap.buf_map('v', key, cmd, opts) end
-- local function lua_vmap(key, cmd, opts)
--     vmap(key, '<C-U>lua  ' .. cmd .. '<CR>', opts)
-- end

-- All of these are buffer mappings
local function mappings()
    lua_nmap('K', 'require("lspsaga.hover").render_hover_doc()')
    lua_nmap('gd', 'vim.lsp.buf.definition()')
    lua_nmap('gD', 'vim.lsp.buf.declaration()')
    lua_nmap('gi', 'vim.lsp.buf.implementation()')
    lua_nmap('gr', 'vim.lsp.buf.references()')
    lua_nmap('<leader>gh', 'vim.lsp.buf.signature_help()')
    lua_nmap('<leader>rn', 'require("lspsaga.rename").rename()')
    lua_nmap('[d', 'require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()')
    lua_nmap(']d', 'require"lspsaga.diagnostic".lsp_jump_diagnostic_next()')
    lua_nmap('<leader>a', 'require("lspsaga.codeaction").code_action()',
             {silent = true})
end

return function(client)
    mappings()

    -- So that the only client with format capabilities is efm
    if client.name ~= 'efm' then
        client.resolved_capabilities.document_formatting = false
    end
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
    end
end
