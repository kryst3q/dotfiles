return {
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>tg", "<cmd>TestVisit<cr>", desc = "Visits the test file from which you last run your tests" },
      { "<leader>tt", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
      { "<leader>tT", "<cmd>TestFile<cr>", desc = "Run all tests in the file" },
      { "<leader>ta", "<cmd>TestSuite<cr>", desc = "Run test suite" },
      { "<leader>tl", "<cmd>TestLast<cr>", desc = "Run last test" },
    },
  },
}
