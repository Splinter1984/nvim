--TODO: in progress

local Log = {}

Log.levels = {
    TRACE = 1,
    DEBUG = 2,
    INFO  = 3,
    WARN  = 4,
    ERROR = 5,
}

vim.tbl_add_reverse_lookup(Log.level)

function Log:set_level(level)
    if not pcall(function()
        local ok, logger = pcall(function()
            return require('structlog').get_logger "config"
        end)
        local log_level = Log.levels[level:upper()]
        if ok and logger and log_level then
            for _, pipeline in pairs(logger.pipelines) do
                pipeline.level = log_level
            end
        end
    end) then
        vim.notify "structlog version too old"
    end
end

function Log:init()
    local ok, structlog = pcall(require, 'structlog')
    if not ok then
        return nil
    end

    local log_level = Log.levels[(config.log.level):upper() or "WARN"]
    structlog.configure {
        config = {
            pipelines = {
                {
                    level = log_level,

                }
            }
        }
    }
end