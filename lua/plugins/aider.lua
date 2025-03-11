return {
  {
    "joshuavial/aider.nvim",
    lazy = false,
    opts = {
      --auto_manage_context = false,
      default_bindings = false,
    },
    init = function()
      vim.api.nvim_set_keymap('n', '<leader>Ao', ':AiderOpen --watch-files<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<leader>Am', ':AiderAddModifiedFiles<CR>', {noremap = true, silent = true})
    end
  },
}
