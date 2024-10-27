return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup({
      providers = {
        -- TODO: make Anthropic the default
        anthropic = {
          endpoint = "https://api.anthropic.com/v1/messages",
          secret = { "anthropic-cli-key" },
        },
        openai = {
          endpoint = "https://api.openai.com/v1/chat/completions",
          secret = { "openai-cli-key" },
        },
        --openai = {
        --  endpoint = "https://openrouter.ai/api/v1/chat/completions",
        --  secret = { "openrouter-cli-key" },
        --},
        googleai = {
          endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
          secret = { "gemini-cli-key" },
        },
      },
      default_command_agent = "CodeClaude-3-5-Sonnet",
      default_chat_agent = "ChatClaude-3-5-Sonnet",
      agents = {
        {
          provider = "openai",
          name = "CodeO1-mini",
          chat = false,
          command = true,
          model = "openai/o1-mini-2024-09-12",
          system_prompt = require("gp.defaults").code_system_prompt,
        },
      },
    })

    -- add custom key mappings using which-key
    require("which-key").add({
      -- VISUAL mode mappings
      -- s, x, v modes are handled the same way by which_key
      {
        mode = { "v" },
        nowait = true,
        remap = false,
        {
          "<C-g><C-t>",
          ":<C-u>'<,'>GpChatNew tabnew<cr>",
          desc = "ChatNew tabnew",
        },
        {
          "<C-g><C-v>",
          ":<C-u>'<,'>GpChatNew vsplit<cr>",
          desc = "ChatNew vsplit",
        },
        {
          "<C-g><C-x>",
          ":<C-u>'<,'>GpChatNew split<cr>",
          desc = "ChatNew split",
        },
        { "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)" },
        {
          "<C-g>b",
          ":<C-u>'<,'>GpPrepend<cr>",
          desc = "Visual Prepend (before)",
        },
        { "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New" },
        { "<C-g>g", group = "generate into new .." },
        { "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew" },
        { "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew" },
        { "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup" },
        { "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew" },
        { "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew" },
        {
          "<C-g>i",
          ":<C-u>'<,'>GpImplement<cr>",
          desc = "Implement selection",
        },
        { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
        { "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste" },
        { "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite" },
        { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
        {
          "<C-g>t",
          ":<C-u>'<,'>GpChatToggle<cr>",
          desc = "Visual Toggle Chat",
        },
        { "<C-g>w", group = "Whisper" },
        {
          "<C-g>wa",
          ":<C-u>'<,'>GpWhisperAppend<cr>",
          desc = "Whisper Append",
        },
        {
          "<C-g>wb",
          ":<C-u>'<,'>GpWhisperPrepend<cr>",
          desc = "Whisper Prepend",
        },
        { "<C-g>we", ":<C-u>'<,'>GpWhisperEnew<cr>", desc = "Whisper Enew" },
        { "<C-g>wn", ":<C-u>'<,'>GpWhisperNew<cr>", desc = "Whisper New" },
        { "<C-g>wp", ":<C-u>'<,'>GpWhisperPopup<cr>", desc = "Whisper Popup" },
        {
          "<C-g>wr",
          ":<C-u>'<,'>GpWhisperRewrite<cr>",
          desc = "Whisper Rewrite",
        },
        {
          "<leader>;;",
          ":<C-u>'<,'>GpWhisperRewrite<cr>",
          desc = "Whisper Rewrite",
        },
        {
          "<C-g>wt",
          ":<C-u>'<,'>GpWhisperTabnew<cr>",
          desc = "Whisper Tabnew",
        },
        { "<C-g>wv", ":<C-u>'<,'>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
        { "<C-g>ww", ":<C-u>'<,'>GpWhisper<cr>", desc = "Whisper" },
        { "<C-g>x", ":<C-u>'<,'>GpContext<cr>", desc = "Visual GpContext" },
      },

      -- NORMAL mode mappings
      {
        mode = { "n" },
        nowait = true,
        remap = false,
        { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
        { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
        { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
        { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
        { "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
        { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
        { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
        { "<C-g>g", group = "generate into new .." },
        { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
        { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
        { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
        { "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
        { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
        { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
        { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
        { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
        { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
        { "<C-g>w", group = "Whisper" },
        {
          "<C-g>wa",
          "<cmd>GpWhisperAppend<cr>",
          desc = "Whisper Append (after)",
        },
        {
          "<C-g>wb",
          "<cmd>GpWhisperPrepend<cr>",
          desc = "Whisper Prepend (before)",
        },
        { "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
        { "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
        { "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
        {
          "<C-g>wr",
          "<cmd>GpWhisperRewrite<cr>",
          desc = "Whisper Inline Rewrite",
        },
        {
          "<leader>;;",
          ":<C-u>%GpWhisperRewrite<cr>",
          desc = "Whisper Rewrite",
        },
        { "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
        { "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
        { "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
        { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
      },

      -- INSERT mode mappings
      {
        mode = { "i" },
        nowait = true,
        remap = false,
        { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
        { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
        { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
        { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
        { "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
        { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
        { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
        { "<C-g>g", group = "generate into new .." },
        { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
        { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
        { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
        { "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
        { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
        { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
        { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
        { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
        { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
        { "<C-g>w", group = "Whisper" },
        {
          "<C-g>wa",
          "<cmd>GpWhisperAppend<cr>",
          desc = "Whisper Append (after)",
        },
        {
          "<C-g>wb",
          "<cmd>GpWhisperPrepend<cr>",
          desc = "Whisper Prepend (before)",
        },
        { "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
        { "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
        { "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
        {
          "<C-g>wr",
          "<cmd>GpWhisperRewrite<cr>",
          desc = "Whisper Inline Rewrite",
        },
        { "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
        { "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
        { "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
        { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
      },
    })
  end,
}
