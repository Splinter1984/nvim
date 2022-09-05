local cmp_status_ok, trouble = pcall(require, "trouble") 
if not cmp_status_ok then
    return
end

trouble.setup()

