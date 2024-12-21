return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
        -- configurations go here
    },
    config = function ()
        require("barbecue").setup({
            attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
            context_follow_icon_color = false,
                symbols = {
        ---Modification indicator.
        ---
        ---@type string
        modified = "●",

        ---Truncation indicator.
        ---
        ---@type string
        ellipsis = "…",

        ---Entry separator.
        ---
        ---@type string
        separator = "",
    },
    kinds = {
        File = "",
        Module = "",
        Namespace = "",
        Package = "",
        Class = "",
        Method = "",
        Property = "",
        Field = "",
        Constructor = "",
        Enum = "",
        Interface = "",
        Function = "",
        Variable = "",
        Constant = "",
        String = "",
        Number = "",
        Boolean = "",
        Array = "",
        Object = "",
        Key = "",
        Null = "",
        EnumMember = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    },
        })
    end
}
