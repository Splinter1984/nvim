local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
  local icons = { ["ERROR"] = " ", ["WARN"] = " ", ["INFO"] = " ", ["HINT"] = " " }
	local signs = {
		{ name = "DiagnosticSignError", text = icons.ERROR },
	  { name = "DiagnosticSignWarn", text = icons.WARN },
		{ name = "DiagnosticSignHint", text = icons.HINT },
		{ name = "DiagnosticSignInfo", text = icons.INFO },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name })
	end

  local get_prefix = function(diagnostic, i, total)
    local icon, highlight
    if diagnostic.severity == 1 then
      icon = icons.ERROR
      highlight = "DiagnosticError"
    elseif diagnostic.severity == 2 then
      icon = icons.WARN
      highlight = "DiagnosticWarn"
    elseif diagnostic.severity == 3 then
      icon = icons.INFO
      highlight = "DiagnosticInfo"
    elseif diagnostic.severity == 4 then
      icon = icons.HINT
      highlight = "DiagnosticHint"
    end
    return i .. "/" .. total .. " " .. icon .. " ", highlight
  end

	local config = {
		virtual_text = false,
		signs = { active = signs },
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
      relative = "cursor",
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      focusable = false,
      focus = false,
      source = "if_many",
      -- "single": A single line box.
      -- "double": A double line box.
      -- "rounded": Like "single", but with rounded corners "╭"
      -- "solid": Adds padding by a single whitespace cell.
      -- "shadow": A drop shadow effect by blending with the
      -- "none": No border (default).
      border = "shadow",
      header = "",
			prefix = get_prefix,
    },
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "shadow",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "shadow",
	})
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end

  lsp_keymaps(bufnr)

end

return M
