vim.g.coq_settings = {["auto_start"] = true, ["keymap.jump_to_mark"] = '<c-s>'}

local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
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
    for _, server in pairs(installed) do
        local config = servers[server] or {}
        config.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
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
    local pop_opts = {border = "rounded", max_width = 80}
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                                                 vim.lsp.handlers.hover,
                                                 pop_opts)
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
end

setup_servers()
