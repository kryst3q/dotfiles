return {
  {
    "mfussenegger/nvim-lint",
    ft = { "yaml", "yml" },
    config = function()
      require("lint").linters_by_ft = {
        yaml = { "yamllint" },
      }
    end,
  },
}
