local lspconfig = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local null_ls = require("null-ls")

local function default_on_attach(client, bufnr)
	client.resolved_capabilities.document_formatting = false

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({float = {border = "single"}})<CR>', opts)
	buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({float = {border = "single"}})<CR>', opts)
	buf_set_keymap("n", "<leader>xr", ":TroubleToggle lsp_references<CR>", opts)
	buf_set_keymap("n", "<leader>xw", ":TroubleToggle lsp_workspace_diagnostics<CR>", opts)
	buf_set_keymap("n", "<leader>xd", ":TroubleToggle lsp_document_diagnostics<CR>", opts)

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		update_in_insert = false,
		signs = false,
		underline = true,
	})

	local pop_opts = { border = "single" }
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)

	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.codespell,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.stylua,

		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.diagnostics.hadolint,
		null_ls.builtins.diagnostics.shellcheck,

		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.shellcheck,
	},
	on_attach = function(client, bufnr)
		default_on_attach(client, bufnr)
		client.resolved_capabilities.document_formatting = true
		vim.cmd([[autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]])
	end,
})

local servers = {
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
			},
		},
	},
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim", "packer_plugins" } },
				completion = { keywordSnippet = "Both" },
				runtime = {
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
				},
				workspace = {
					library = vim.list_extend({
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					}, {}),
				},
			},
		},
	},
	tsserver = {
		init_options = {
			preferences = {
				importModuleSpecifierPreference = "relative",
			},
		},
		on_attach = function(client, bufnr)
			-- disable tsserver formatting if you plan on formatting via null-ls
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false

			local ts_utils = require("nvim-lsp-ts-utils")

			-- defaults
			ts_utils.setup({
				debug = false,
				disable_commands = false,
				enable_import_on_completion = false,

				-- import all
				import_all_timeout = 5000, -- ms
				import_all_priorities = {
					buffers = 4, -- loaded buffer names
					buffer_content = 3, -- loaded buffer content
					local_files = 2, -- git files or files with relative path markers
					same_file = 1, -- add to existing import statement
				},
				import_all_scan_buffers = 100,
				import_all_select_source = false,

				-- eslint
				eslint_enable_code_actions = true,
				eslint_enable_disable_comments = true,
				eslint_bin = "eslint_d",
				eslint_enable_diagnostics = true,
				eslint_opts = {},

				-- formatting
				enable_formatting = false,
				formatter = "prettier",
				formatter_opts = {},

				-- update imports on file move
				update_imports_on_move = false,
				require_confirmation_on_move = false,
				watch_dir = nil,

				-- filter diagnostics
				filter_out_diagnostics_by_severity = {},
				filter_out_diagnostics_by_code = {},
			})

			-- required to fix code action ranges and filter diagnostics
			ts_utils.setup_client(client)

			-- no default maps, so you may want to define some here
			-- local opts = { silent = true }
			-- vim.api.nvim_buf_set_keymap(bufnr, "n", "", ":TSLspOrganize<CR>", opts)
			-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
			-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)

			default_on_attach(client, bufnr)
		end,
	},
}

local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Information = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

lsp_installer.on_server_ready(function(server)
	local opts = servers[server.name] or {}
	opts.on_attach = opts.on_attach or default_on_attach
	opts.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

	server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)
