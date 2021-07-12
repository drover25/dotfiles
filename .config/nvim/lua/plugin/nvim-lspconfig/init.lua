local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')
local lspsaga = require('lspsaga')
local languages = require('plugin.nvim-lspconfig.format')
local on_attach = require('plugin.nvim-lspconfig.on-attach')

local servers = {
    efm = {
        init_options = {documentFormatting = true, codeAction = true},
        root_dir = function(fname)
            return lspconfig.util.root_pattern("tsconfig.json")(fname) or
                       lspconfig.util
                           .root_pattern(".eslintrc.js", ".git")(fname) or
                       lspconfig.util.root_pattern(".git")(fname) or
                       lspconfig.util.root_pattern("./")(fname);
        end,
        filetypes = vim.tbl_keys(languages),
        settings = {
            -- rootMarkers = {".eslintrc.js", ".git/"},
            languages = languages,
            log_level = 1,
            log_file = '~/efm.log'
        }
    },
    lua = {
        settings = {
            Lua = {
                diagnostics = {globals = {'vim', 'packer_plugins'}},
                completion = {keywordSnippet = 'Both'},
                runtime = {
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';')
                },
                workspace = {
                    library = vim.list_extend({
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true
                    }, {})
                }
            }
        }
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}

local function setup_servers()
    lspinstall.setup()
    local installed = lspinstall.installed_servers()
    lspsaga.init_lsp_saga({
        -- add your config value here
        -- default value
        use_saga_diagnostic_sign = true,
        error_sign = ' ',
        warn_sign = ' ',
        hint_sign = '',
        infor_sign = ''
    })
    for _, server in pairs(installed) do
        local config = servers[server] or {}
        config.capabilities = capabilities
        config.on_attach = on_attach
        lspconfig[server].setup(config)
    end
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = true,
            update_in_insert = false,
            underline = true
        })
    vim.cmd [[ autocmd CursorHold * lua require'lspsaga.diagnostic'.show_cursor_diagnostics() ]]

    vim.cmd [[ highlight link LspSagaDiagnosticBorder Statement ]]
    vim.cmd [[ highlight link LspSagaDiagnosticHeader WarningMsg ]]
    vim.cmd [[ highlight link LspSagaDiagnosticTruncateLine Statement ]]
    vim.cmd [[ highlight link LspDiagnosticsFloatingError TSError ]]
    vim.cmd [[ highlight link LspDiagnosticsFloatingWarn WarningMsg ]]

end

setup_servers()
