local cmp_status_ok, todo_comments = pcall(require, "todo-comments")
if not cmp_status_ok then
    return
end

todo_comments.setup()

