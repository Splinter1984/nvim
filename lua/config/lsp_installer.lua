local lsp_installer = require("nvim-lsp-installer")

local lsp_installer_servers = require('nvim-lsp-installer.servers')
--local sumneko_opts = require 'config.lua_lsp'

local servers = {
    "rust_analyzer",
    "clangd",
    "sumneko_lua",
}

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function ()
            -- When this particular server is ready
            -- (i.e. when installation is finished or the server is already installed),
            -- this function will be invoked.
            -- Make sure not to also use the "catch-all" lsp_installer.on_server_ready()
            -- function to set up your servers,
            -- because by doing so you'd be setting up the same server twice.
            local opts = {}
            if server_name == 'sumneko_lua' then
                opts.settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'}
                        }
                    }
                }
            end

            server:setup(opts)
        end)
        if not server:is_installed() then
            -- Queue the server to be installed.
            server:install()
        end
    end
end
