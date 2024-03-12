return {
  -- Show git blame in the current line
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
  {
    "preservim/nerdcommenter",
    event = "VeryLazy",
  },
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    "ruifm/gitlinker.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      mappings = "<leader>gy",
    },
  },
  -- Useless but fun screensaver plugin
  {
    "Eandrju/cellular-automaton.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain" },
    },
  },
}
