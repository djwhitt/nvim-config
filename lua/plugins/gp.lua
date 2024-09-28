return {
  "robitx/gp.nvim",
  config = function()
    -- configuration for the plugin
    local conf = {
      openai_api_key = { "openai-cli-key" },
    }
    -- set up the plugin with the provided configuration
    require("gp").setup(conf)

    -- add custom key mappings using which-key
    require("which-key").add {
      -- visual mode mappings
      -- s, x, v modes are handled the same way by which_key
      {
        mode = { "v" },
        nowait = true,
        remap = false,
        {
          "<c-g><c-t>",
          ":<c-u>'<,'>gpchatnew tabnew<cr>",
          desc = "chatnew tabnew",
        },
        {
          "<c-g><c-v>",
          ":<c-u>'<,'>gpchatnew vsplit<cr>",
          desc = "chatnew vsplit",
        },
        {
          "<c-g><c-x>",
          ":<c-u>'<,'>gpchatnew split<cr>",
          desc = "chatnew split",
        },
        { "<c-g>a", ":<c-u>'<,'>gpappend<cr>", desc = "visual append (after)" },
        {
          "<c-g>b",
          ":<c-u>'<,'>gpprepend<cr>",
          desc = "visual prepend (before)",
        },
        { "<c-g>c", ":<c-u>'<,'>gpchatnew<cr>", desc = "visual chat new" },
        { "<c-g>g", group = "generate into new .." },
        { "<c-g>ge", ":<c-u>'<,'>gpenew<cr>", desc = "visual gpenew" },
        { "<c-g>gn", ":<c-u>'<,'>gpnew<cr>", desc = "visual gpnew" },
        { "<c-g>gp", ":<c-u>'<,'>gppopup<cr>", desc = "visual popup" },
        { "<c-g>gt", ":<c-u>'<,'>gptabnew<cr>", desc = "visual gptabnew" },
        { "<c-g>gv", ":<c-u>'<,'>gpvnew<cr>", desc = "visual gpvnew" },
        {
          "<c-g>i",
          ":<c-u>'<,'>gpimplement<cr>",
          desc = "implement selection",
        },
        { "<c-g>n", "<cmd>gpnextagent<cr>", desc = "next agent" },
        { "<c-g>p", ":<c-u>'<,'>gpchatpaste<cr>", desc = "visual chat paste" },
        { "<c-g>r", ":<c-u>'<,'>gprewrite<cr>", desc = "visual rewrite" },
        { "<c-g>s", "<cmd>gpstop<cr>", desc = "gpstop" },
        {
          "<c-g>t",
          ":<c-u>'<,'>gpchattoggle<cr>",
          desc = "visual toggle chat",
        },
        { "<c-g>w", group = "whisper" },
        {
          "<c-g>wa",
          ":<c-u>'<,'>gpwhisperappend<cr>",
          desc = "whisper append",
        },
        {
          "<c-g>wb",
          ":<c-u>'<,'>gpwhisperprepend<cr>",
          desc = "whisper prepend",
        },
        { "<c-g>we", ":<c-u>'<,'>gpwhisperenew<cr>", desc = "whisper enew" },
        { "<c-g>wn", ":<c-u>'<,'>gpwhispernew<cr>", desc = "whisper new" },
        { "<c-g>wp", ":<c-u>'<,'>gpwhisperpopup<cr>", desc = "whisper popup" },
        {
          "<c-g>wr",
          ":<c-u>'<,'>gpwhisperrewrite<cr>",
          desc = "whisper rewrite",
        },
        {
          "<c-g>wt",
          ":<c-u>'<,'>gpwhispertabnew<cr>",
          desc = "whisper tabnew",
        },
        { "<c-g>wv", ":<c-u>'<,'>gpwhispervnew<cr>", desc = "whisper vnew" },
        { "<c-g>ww", ":<c-u>'<,'>gpwhisper<cr>", desc = "whisper" },
        { "<c-g>x", ":<c-u>'<,'>gpcontext<cr>", desc = "visual gpcontext" },
      },

      -- normal mode mappings
      {
        mode = { "n" },
        nowait = true,
        remap = false,
        { "<c-g><c-t>", "<cmd>gpchatnew tabnew<cr>", desc = "new chat tabnew" },
        { "<c-g><c-v>", "<cmd>gpchatnew vsplit<cr>", desc = "new chat vsplit" },
        { "<c-g><c-x>", "<cmd>gpchatnew split<cr>", desc = "new chat split" },
        { "<c-g>a", "<cmd>gpappend<cr>", desc = "append (after)" },
        { "<c-g>b", "<cmd>gpprepend<cr>", desc = "prepend (before)" },
        { "<c-g>c", "<cmd>gpchatnew<cr>", desc = "new chat" },
        { "<c-g>f", "<cmd>gpchatfinder<cr>", desc = "chat finder" },
        { "<c-g>g", group = "generate into new .." },
        { "<c-g>ge", "<cmd>gpenew<cr>", desc = "gpenew" },
        { "<c-g>gn", "<cmd>gpnew<cr>", desc = "gpnew" },
        { "<c-g>gp", "<cmd>gppopup<cr>", desc = "popup" },
        { "<c-g>gt", "<cmd>gptabnew<cr>", desc = "gptabnew" },
        { "<c-g>gv", "<cmd>gpvnew<cr>", desc = "gpvnew" },
        { "<c-g>n", "<cmd>gpnextagent<cr>", desc = "next agent" },
        { "<c-g>r", "<cmd>gprewrite<cr>", desc = "inline rewrite" },
        { "<c-g>s", "<cmd>gpstop<cr>", desc = "gpstop" },
        { "<c-g>t", "<cmd>gpchattoggle<cr>", desc = "toggle chat" },
        { "<c-g>w", group = "whisper" },
        {
          "<c-g>wa",
          "<cmd>gpwhisperappend<cr>",
          desc = "whisper append (after)",
        },
        {
          "<c-g>wb",
          "<cmd>gpwhisperprepend<cr>",
          desc = "whisper prepend (before)",
        },
        { "<c-g>we", "<cmd>gpwhisperenew<cr>", desc = "whisper enew" },
        { "<c-g>wn", "<cmd>gpwhispernew<cr>", desc = "whisper new" },
        { "<c-g>wp", "<cmd>gpwhisperpopup<cr>", desc = "whisper popup" },
        {
          "<c-g>wr",
          "<cmd>gpwhisperrewrite<cr>",
          desc = "whisper inline rewrite",
        },
        { "<c-g>wt", "<cmd>gpwhispertabnew<cr>", desc = "whisper tabnew" },
        { "<c-g>wv", "<cmd>gpwhispervnew<cr>", desc = "whisper vnew" },
        { "<c-g>ww", "<cmd>gpwhisper<cr>", desc = "whisper" },
        { "<c-g>x", "<cmd>gpcontext<cr>", desc = "toggle gpcontext" },
      },

      -- insert mode mappings
      {
        mode = { "i" },
        nowait = true,
        remap = false,
        { "<c-g><c-t>", "<cmd>gpchatnew tabnew<cr>", desc = "new chat tabnew" },
        { "<c-g><c-v>", "<cmd>gpchatnew vsplit<cr>", desc = "new chat vsplit" },
        { "<c-g><c-x>", "<cmd>gpchatnew split<cr>", desc = "new chat split" },
        { "<c-g>a", "<cmd>gpappend<cr>", desc = "append (after)" },
        { "<c-g>b", "<cmd>gpprepend<cr>", desc = "prepend (before)" },
        { "<c-g>c", "<cmd>gpchatnew<cr>", desc = "new chat" },
        { "<c-g>f", "<cmd>gpchatfinder<cr>", desc = "chat finder" },
        { "<c-g>g", group = "generate into new .." },
        { "<c-g>ge", "<cmd>gpenew<cr>", desc = "gpenew" },
        { "<c-g>gn", "<cmd>gpnew<cr>", desc = "gpnew" },
        { "<c-g>gp", "<cmd>gppopup<cr>", desc = "popup" },
        { "<c-g>gt", "<cmd>gptabnew<cr>", desc = "gptabnew" },
        { "<c-g>gv", "<cmd>gpvnew<cr>", desc = "gpvnew" },
        { "<c-g>n", "<cmd>gpnextagent<cr>", desc = "next agent" },
        { "<c-g>r", "<cmd>gprewrite<cr>", desc = "inline rewrite" },
        { "<c-g>s", "<cmd>gpstop<cr>", desc = "gpstop" },
        { "<c-g>t", "<cmd>gpchattoggle<cr>", desc = "toggle chat" },
        { "<c-g>w", group = "whisper" },
        {
          "<c-g>wa",
          "<cmd>gpwhisperappend<cr>",
          desc = "whisper append (after)",
        },
        {
          "<c-g>wb",
          "<cmd>gpwhisperprepend<cr>",
          desc = "whisper prepend (before)",
        },
        { "<c-g>we", "<cmd>gpwhisperenew<cr>", desc = "whisper enew" },
        { "<c-g>wn", "<cmd>gpwhispernew<cr>", desc = "whisper new" },
        { "<c-g>wp", "<cmd>gpwhisperpopup<cr>", desc = "whisper popup" },
        {
          "<c-g>wr",
          "<cmd>gpwhisperrewrite<cr>",
          desc = "whisper inline rewrite",
        },
        { "<c-g>wt", "<cmd>gpwhispertabnew<cr>", desc = "whisper tabnew" },
        { "<c-g>wv", "<cmd>gpwhispervnew<cr>", desc = "whisper vnew" },
        { "<c-g>ww", "<cmd>gpwhisper<cr>", desc = "whisper" },
        { "<c-g>x", "<cmd>gpcontext<cr>", desc = "toggle gpcontext" },
      },
    }

    -- example commented-out mappings for which-key
    --wk.add {
    --  -- visual mode mappings
    --  {
    --    mode = { "v" },
    --    nowait = true,
    --    remap = false,
    --    {
    --      "<leader><leader>",
    --      ":<c-u>'<,'>gprewrite<cr>",
    --      desc = "visual rewrite",
    --    },
    --  },

    --  -- normal mode mappings
    --  {
    --    mode = { "n" },
    --    nowait = true,
    --    remap = false,
    --    { "<leader><leader>", "<cmd>%gprewrite<cr>", desc = "buffer rewrite" },
    --  },
    --}
  end,
}

