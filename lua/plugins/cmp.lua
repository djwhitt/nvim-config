return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")

    -- Adjust <Tab> behavior as recommended by copilot-cmp
    local has_words_before = function()
      if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0
        and vim.api
            .nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]
            :match("^%s*$")
          == nil
    end

    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end)

    opts.event = {
      on_confirm_done = function()
        local ft = vim.bo.filetype
        if ft == "clojure" then
          -- Get current Parinfer state
          local was_enabled = vim.b.parinfer_enabled == true

          if not was_enabled then
            -- Only enable if it wasn't already enabled
            vim.cmd("ParinferOn")

            -- Restore previous state after completion
            vim.defer_fn(function()
              vim.cmd("ParinferOff")
            end, 0)
          end
        end

        return true
      end,
    }

    -- copilot-cmp recommended config
    opts.sources = cmp.config.sources({
      { name = "copilot", group_index = 2 },
      { name = "nvim_lsp", group_index = 2 },
      { name = "luasnip", group_index = 2 },
      --{ name = "buffer", group_index = 2 },
      { name = "path", group_index = 2 },
    })

    -- copilot-cmp recommended config
    opts.formatting = {
      format = lspkind.cmp_format({
        mode = "symbol",
        max_width = 50,
        symbol_map = { Copilot = "" },
      }),
    }

    -- copilot-cmp recommended config
    opts.sorting = {
      priority_weight = 2,
      comparators = {
        require("copilot_cmp.comparators").prioritize,

        -- Below is the default comparitor list and order for nvim-cmp
        cmp.config.compare.offset,
        -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    }

    opts.completion = {
      autocomplete = false,
    }

    return opts
  end,
}
