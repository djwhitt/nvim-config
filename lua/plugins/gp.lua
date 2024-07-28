return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      openai_api_key = { "openai-cli-key" },
    }
    require("gp").setup(conf)

    local wk = require("which-key")
    wk.add {
      -- VISUAL mode mappings
      {
        mode = { "v" },
        nowait = true,
        remap = false,
        {
          "<leader><leader>",
          ":<C-u>'<,'>GpRewrite<cr>",
          desc = "Visual Rewrite",
        },
      },

      -- NORMAL mode mappings
      {
        mode = { "n" },
        nowait = true,
        remap = false,
        { "<leader><leader>", "<cmd>%GpRewrite<cr>", desc = "Buffer Rewrite" },
      },
    }
  end,
}
