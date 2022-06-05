local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_add_trailing = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat {":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??"}

g.nvim_tree_show_icons = {
    folders = 1,
    folder_arrows = 1,
    files = 1,
    git = 1
}

g.nvim_tree_icons = {
    default = "",
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        empty = "", -- 
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = ""
    },
    symlink = "",
    git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untacked = "★"
    },
    lsp = {
        error = " ",
        warning = " ",
        hint = " ",
        info = " "
    }
}

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {"startify", "dashboard", "alpha"},
    auto_close = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    update_to_buf_dir = {
        enable = true,
        auto_open = true
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {{
                key = {"l", "<CR>", "o"},
                cb = tree_cb "edit"
            }, {
                key = "h",
                cb = tree_cb "close_node"
            }, {
                key = "v",
                cb = tree_cb "vsplit"
            }}
        },
        number = false,
        relativenumber = false
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    }
}
