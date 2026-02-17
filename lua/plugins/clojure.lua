local conjure_fts = {
  "clojure",
  "fennel",
}
local sexp_fts = {
  "clojure",
  "scheme",
  "lisp",
  "racket",
  "hy",
  "fennel",
  "janet",
  "carp",
  "wast",
  "yuck",
}
return {
  -- Syntax
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "clojure" })
      end
    end,
  },
  {
    "clojure-vim/clojure.vim",
    ft = "clojure",
    init = function()
      -- Attempt to follow cljfmt defaults
      vim.g["clojure_align_subforms"] = 1
      vim.g["clojure_fuzzy_indent_patterns"] = {
        "^case$",
        "^comment$",
        "^cond$",
        "^def",
        "^do",
        "^future$",
        "^tests",
        "^thread$",
        "^try$",
        "^vthread-loop",
        "^with",
      }
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    ft = sexp_fts,
  },

  -- Editing
  {
    "gpanders/nvim-parinfer",
    ft = sexp_fts,
    dependencies = { "folke/which-key.nvim" },
    config = function()
      vim.g["parinfer_enabled"] = false

      local wk = require("which-key")
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup(
          "MyParinferMappings",
          { clear = true }
        ),
        callback = function()
          wk.add({
            { "<localleader>p", group = "Parinfer", buffer = 0 },
            {
              "<localleader>pt",
              "<cmd>ParinferToggle<cr>",
              desc = "Toggle Parinfer",
              buffer = 0,
            },
            {
              "<localleader>pe",
              "<cmd>ParinferOn<cr>",
              desc = "Enable Parinfer",
              buffer = 0,
            },
            {
              "<localleader>pd",
              "<cmd>ParinferOff<cr>",
              desc = "Disable Parinfer",
              buffer = 0,
            },
          })
        end,
        pattern = "clojure",
      })
    end,
  },
  { "guns/vim-sexp", ft = sexp_fts },
  { "tpope/vim-sexp-mappings-for-regular-people", ft = sexp_fts },

  -- Runtime and REPL
  { "tpope/vim-classpath", lazy = true, ft = { "java", "clojure" } },
  {
    "Olical/conjure",
    ft = conjure_fts,
    lazy = true,
    init = function()
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] =
        "conjure-auto-repl $port"
      vim.g["conjure#client#clojure#nrepl#refresh#backend"] = "clj-reload"
      vim.g["conjure#client#clojure#nrepl#refresh#before"] = "user/stop"
      vim.g["conjure#client#clojure#nrepl#refresh#after"] = "user/start"
      vim.g["conjure#log#botright"] = true
      vim.g["conjure#mapping#doc_word"] = "gk"

      -- Use Lisp style line comments
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(_ev)
          vim.bo.commentstring = ";; %s"
        end,
        group = vim.api.nvim_create_augroup(
          "MyClojureCommentConfig",
          { clear = true }
        ),
        pattern = "clojure",
      })

      -- Parinfer completion hack: briefly enable Parinfer after completion
      -- to re-balance brackets inserted by the completion engine
      vim.api.nvim_create_autocmd("CompleteDone", {
        group = vim.api.nvim_create_augroup(
          "ParinferCompletionHack",
          { clear = true }
        ),
        pattern = "*.clj,*.cljs,*.cljc,*.edn",
        callback = function()
          if vim.b.parinfer_enabled ~= true then
            vim.cmd("ParinferOn")
            vim.defer_fn(function()
              vim.cmd("ParinferOff")
            end, 0)
          end
        end,
      })
    end,
  },
}
