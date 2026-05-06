---@type LazySpec
return {
  "folke/sidekick.nvim",
  specs = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        local prefix = "<Leader>a"

        maps.n[prefix] = { desc = "Sidekick" }
        maps.n[prefix .. "a"] = {
          function() require("sidekick.cli").toggle() end,
          desc = "Sidekick Toggle CLI",
        }
        maps.n[prefix .. "c"] = {
          function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
          desc = "Sidekick Toggle Claude Code",
        }
        maps.n[prefix .. "s"] = {
          function() require("sidekick.cli").select() end,
          desc = "Select CLI",
        }
        maps.n[prefix .. "d"] = {
          function() require("sidekick.cli").close() end,
          desc = "Detach a CLI Session",
        }
        maps.n[prefix .. "t"] = {
          function() require("sidekick.cli").send({ msg = "{this}" }) end,
          desc = "Send This",
        }
        maps.n[prefix .. "f"] = {
          function() require("sidekick.cli").send({ msg = "{file}" }) end,
          desc = "Send File",
        }
        maps.n[prefix .. "p"] = {
          function() require("sidekick.cli").prompt() end,
          desc = "Select Prompt",
        }

        maps.n[prefix .. "n"] = { desc = "NES" }
        maps.n[prefix .. "nt"] = {
          function() require("sidekick.nes").toggle() end,
          desc = "Toggle NES",
        }
        maps.n[prefix .. "ne"] = {
          function() require("sidekick.nes").enable() end,
          desc = "Enable NES",
        }
        maps.n[prefix .. "nd"] = {
          function() require("sidekick.nes").disable() end,
          desc = "Disable NES",
        }
        maps.n[prefix .. "nu"] = {
          function() require("sidekick.nes").update() end,
          desc = "Update Suggestions",
        }

        maps.n["<Tab>"] = {
          function()
            if not require("sidekick").nes_jump_or_apply() then return "<Tab>" end
          end,
          expr = true,
          desc = "Goto/Apply Next Edit Suggestion",
        }
        maps.n["<C-.>"] = {
          function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
          desc = "Sidekick Toggle Claude",
        }

        maps.x = maps.x or {}
        maps.x[prefix] = { desc = "Sidekick" }
        maps.x[prefix .. "t"] = {
          function() require("sidekick.cli").send({ msg = "{this}" }) end,
          desc = "Send This",
        }
        maps.x[prefix .. "v"] = {
          function() require("sidekick.cli").send({ msg = "{selection}" }) end,
          desc = "Send Visual Selection",
        }
        maps.x[prefix .. "p"] = {
          function() require("sidekick.cli").prompt({}) end,
          desc = "Select Prompt",
        }
        maps.x["<C-.>"] = {
          function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
          desc = "Sidekick Toggle Claude",
        }

        maps.i = maps.i or {}
        maps.i["<C-.>"] = {
          function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
          desc = "Sidekick Toggle Claude",
        }

        maps.t = maps.t or {}
        maps.t["<C-.>"] = {
          function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
          desc = "Sidekick Toggle Claude",
        }
      end,
    },
  },
  opts = {
    nes = {
      enabled = true,
    },
    cli = {
      mux = {
        enabled = true,
      },
    },
  },
}
