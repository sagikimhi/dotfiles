-- ----------------------------------------------------------------------------
-- Terminal Keymaps
-- ----------------------------------------------------------------------------

vim.keymap.set({ "t" }, "<Esc>", "<C-\\><C-n>")
vim.keymap.set({ "n", "v", "t" }, "<C-t>", vim.cmd.Fterm)

-- ----------------------------------------------------------------------------
-- Editor Keymaps
-- ----------------------------------------------------------------------------

-- Move lines up/down and align
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Centered navigation remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zzzv")

-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Paste/Delete without yanking
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>c", [["_c]])
vim.keymap.set({ "n", "v" }, "<leader>C", [["_C]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>D", [["_D]])

-- Allows Ctrl + C in addition to Esc
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Toggle Oil file browser
vim.keymap.set("n", "<C-e>", "<cmd>Oil<cr>")

-- Functions
vim.keymap.set("n", "<leader>q", function()
	for _, ui in pairs(vim.api.nvim_list_uis()) do
		if ui.chan and not ui.stdout_tty then
			vim.fn.chanclose(ui.chan)
		end
	end
end, { noremap = true })

-- Search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Remove trailing whitespace and comment headers past column 80
vim.keymap.set("n", "Q", [[<cmd>silent! %g/-\{3,80\}/s/\%80c.*//<cr>]] .. [[<cmd>silent! %s/\s\+$//<cr>]])
-- Incremental rename
vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Window navigation and resize
vim.keymap.set("n", "<leader>h", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<leader>j", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>wincmd k<CR>")

-- Make it rain baby
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Documentation Header Shortcuts
vim.keymap.set(
	{ "n", "x" },
	"<leader>-",
	[[mzyyp^<cmd>.,.Commentary<cr>v$r-<cmd>.,.Commentary<cr>`z]],
	{ remap = true }
)
vim.keymap.set({ "n", "x" }, "<leader>_", "<leader>-<leader>-ddp", { remap = true })
vim.keymap.set(
	{ "n", "x" },
	"<leader>i",
	'^f(ByiwO<Esc>^"_Dp<Plug>Commentary<leader>-jo<esc><cmd>s/.*//<cr>',
	{ remap = true }
)
vim.keymap.set(
	{ "n", "x" },
	"<leader>=j",
	[[mzo<esc>80i-<esc><cmd>.,.Commentary<cr><cmd>.,.s/\%80c.*//<cr>`z]],
	{ remap = true }
)
vim.keymap.set(
	{ "n", "x" },
	"<leader>=k",
	[[mzO<esc>80i-<esc><cmd>.,.Commentary<cr><cmd>.,.s/\%80c.*//<cr>`z]],
	{ remap = true }
)
vim.keymap.set({ "n", "x" }, "<leader>==", "<leader>=j<leader>=k", { remap = true })
vim.keymap.set({ "n", "x" }, "<leader>gl", [[mzggO]] .. [[
==============================================================================

             GLWTS(Good Luck With That Shit) Public License
           Copyright (c) Every-fucking-one, except the Author

Everyone is permitted to copy, distribute, modify, merge, sell, publish,
sublicense or whatever the fuck they want with this software but at their
                               OWN RISK.

                                Preamble

The author has absolutely no fucking clue what the code in this project
   does. It might just fucking work or not, there is no third option.

                GOOD LUCK WITH THAT SHIT PUBLIC LICENSE
    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION, AND MODIFICATION

0. You just DO WHATEVER THE FUCK YOU WANT TO as long as you NEVER LEAVE
A FUCKING TRACE TO TRACK THE AUTHOR of the original product to blame for
                          or hold responsible.

IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
                       DEALINGS IN THE SOFTWARE.

                        Good luck and Godspeed.

==============================================================================
<Esc><cmd>1,29Commentary<cr>gg^<C-v>28jlxggdd<cmd>1,29s/\%80c.*//<cr>'z]])
