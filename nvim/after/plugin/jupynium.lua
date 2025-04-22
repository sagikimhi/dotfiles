return {
  "rcarriga/nvim-notify",   -- optional
  "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
  {
    "kiyoon/jupynium.nvim",
    build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
  },
}
