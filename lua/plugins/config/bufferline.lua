local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup {
    options = {
        mode = "buffers",
        numbers = "none",
        separator_style = "slant",
        sort_by = 'insert_after_current',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true
    }
}
