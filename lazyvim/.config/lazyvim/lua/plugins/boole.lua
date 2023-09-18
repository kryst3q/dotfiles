return {
  {
    "nat-418/boole.nvim",
    init = function()
      require("boole").setup({
        mappings = {
          increment = "<C-a>",
          decrement = "<C-x>",
        },
      })
    end,
  },
}
