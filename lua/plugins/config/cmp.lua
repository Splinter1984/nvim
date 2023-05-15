local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

require("luasnip.loaders.from_vscode").load({
  paths = vim.fn.stdpath ("config") .. "/lua/plugins/config/snippets"
})

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

require("luasnip.")

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local source_icons = {
  nvim_lsp = "[LSP]",
  luasnip = "[Snippet]",
  buffer = "[Buffer]",
  path = "[Path]"
}

cmp.setup {
  view = {
    entries = { name = "custom", selection_order = "near_cursor" }
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = false },
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    max_width = 40,
    format = function(entry, vim_item)
      --[[
      function trim(text)
        local max_width = 50
        if text and text:len() > max_width then
          text = text:sub(1, max_width) .. "..."
        end
      end
      ]]--
      vim_item.kind = (kind_icons[vim_item.kind] or "?") .. " " .. vim_item.kind
      vim_item.menu = source_icons[entry.source.name]
      --vim_item.abbr = trim(vim_item.abbr)
      vim_item.abbr = vim_item.abbr:match("[^(]+")
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  window = {
    completion = cmp.config.window.bordered({border="shadow"}),
    documentation = cmp.config.window.bordered({border="shadow"})
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}
