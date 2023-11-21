local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"gopls",
	"eslint",
	"rust-analyzer"
})

lsp.set_preferences({
	sign_icons = {}
})
--

lsp.default_keymaps({
	buffer = bufnr,
	preserve_mappings = false
})

local function on_attach(client, buffer)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end

lsp.on_attach(on_attach)

lsp.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = false,
		virtual_text = true,
		underline = false,
	}
)
