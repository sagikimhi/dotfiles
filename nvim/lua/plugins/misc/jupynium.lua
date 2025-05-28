return {
	{
		"kiyoon/jupynium.nvim",
		lazy = true,
		build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
		dependencies = {
			"rcarriga/nvim-notify", -- optional
			"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
		},
	},
}
