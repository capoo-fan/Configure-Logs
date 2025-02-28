return {

    "stevearc/conform.nvim",
    dependencies = {"mason.nvim"},
    lazy = false,
    event = {"BufWritePre"},
    cmd = {"ConformInfo"},
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>cf",
            function() require("conform").format({async = true}) end,
            mode = "",
            desc = "Format buffer"
        }
    },
    --
    init = function()
        -- Install the conform formatter on VeryLazy
        LazyVim.on_very_lazy(function()
            LazyVim.format.register({
                name = "conform.nvim",
                priority = 100,
                primary = true,
                format = function(buf)
                    require("conform").format({bufnr = buf})
                end,
                sources = function(buf)
                    local ret = require("conform").list_formatters(buf)
                    ---@param v conform.FormatterInfo
                    return vim.tbl_map(function(v)
                        return v.name
                    end, ret)
                end
            })
        end)
    end,
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback" -- not recommended to change
    },
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            cpp = {"clang-format"},
            lua = {"stylua"}
            -- python = {"isort", "black"},
            -- javascript = {"prettierd", "prettier", stop_after_first = true}

        },
        -- Set default options
        default_format_opts = {lsp_format = "fallback"},
        -- Set up format-on-save
        -- format_on_save = {timeout_ms = 500},
        -- Customize formatters
        formatters = {shfmt = {prepend_args = {"-i", "2"}}}
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end

}
