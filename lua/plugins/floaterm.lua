return {
  {
    "voldikss/vim-floaterm",
    keys = {
      {
        "<leader>tv",
        "<cmd>FloatermNew --wintype=vsplit --width=0.5 --name=termv<cr>",
        mode = "n",
        desc = "Terminal New Vertical",
      },
      {
        "<leader>th",
        "<cmd>FloatermNew --wintype=split --height=0.3 --name=termh<cr>",
        mode = "n",
        desc = "Terminal New Horisontal",
      },
      { "<leader>tf", "<cmd>FloatermNew --name=termf<cr>", mode = "n", desc = "Terminal New Float" },
      { "<leader>tn", "<cmd>FloatermNext<cr>", mode = { "n", "t" }, desc = "Terminal Next" },
      { "<leader>tv", "<cmd>FloatermToggle termv<cr>", mode = "t", desc = "Terminal Toggle Vertical" },
      { "<leader>th", "<cmd>FloatermToggle termh<cr>", mode = "t", desc = "Terminal Toggle Horisontal" },
      { "<leader>tf", "<cmd>FloatermToggle termf<cr>", mode = "t", desc = "Terminal Toggle Float" },
      { "<leader>tk", "<cmd>FloatermKill<cr>", mode = "t", desc = "Terminal Kill" },
      { "<esc>", "<C-\\><C-n>", mode = "t", desc = "Terminal Mode Exit" },
      { "jk", "<C-\\><C-n>", mode = "t", desc = "Terminal Mode Exit" },

      {
        "<leader>trh",
        ":FloatermNew --wintype=split --height=0.4 --autoclose=0 python3 % <cr>",
        mode = "n",
        desc = "Terminal Horisontal Split Run File",
      },
      {
        "<leader>trv",
        ":FloatermNew --wintype=vsplit --width=0.4 --autoclose=0 python3 % <cr>",
        mode = "n",
        desc = "Terminal Vertical Split Run File",
      },
      {
        "<leader>trf",
        ":FloatermNew --autoclose=0 python3 % <cr>",
        mode = "n",
        desc = "Terminal Vertical Split Run File",
      },
    },
  },
}
