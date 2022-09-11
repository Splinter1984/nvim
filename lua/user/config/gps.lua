local cmp_status_ok, nvim_gps = pcall(require, "nvim-gps")
if not cmp_status_ok then
    return
end

nvim_gps.setup({

    disable_icons = false, -- Setting it to true will disable all icons

    icons = {
        ["class-name"] = ' ', -- Classes and class-like objects
        ["function-name"] = ' ', -- Functions
        ["method-name"] = ' ', -- Methods (functions inside class-like objects)
        ["container-name"] = '⛶ ', -- Containers (example: lua tables)
        ["tag-name"] = '炙' -- Tags (example: html tags)
    },

    separator = ' > ',

    -- limit for amount of context shown
    -- 0 means no limit
    depth = 0,

    -- indicator used when context hits depth limit
    depth_limit_indicator = ".."
})

