local cmp_status_ok, cmake_tools = pcall(require, "cmake-tools")
if not cmp_status_ok then
    return
end

cmake_tools.setup{
    cmake_command = "cmake",
    cmake_build_directory = "build",
    cmake_build_type = "Debug",
    cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_options = {},
    cmake_console_size = 10, -- cmake output window height
    cmake_show_console = "always", -- "always", "only_on_error"
}

