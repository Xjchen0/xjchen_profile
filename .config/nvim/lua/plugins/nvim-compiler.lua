return {
  {
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
    config = function(_, opts)
      require("overseer").setup(opts)
    end,
  },
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = {
      "stevearc/overseer.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
    config = function(_, opts)
      require("compiler").setup(opts)
      local compiler = require("compiler")
      local cpp_config = require("compiler.languages.cpp")
      if not compiler.filetypes then
        compiler.filetypes = {}
      end
      compiler.filetypes.cpp = cpp_config
      compiler.filetypes.cxx = cpp_config
    end,
  },
}
