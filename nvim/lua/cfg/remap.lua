vim.g.mapleader = " "

vim.cmd.tnoremap("<Esc> <C-\\><C-n>")
vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")

-- move lines up/down and align
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- centered navigation remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zzzv")

-- Paste without yanking
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>c", [["_c]])
vim.keymap.set({ "n", "v" }, "<leader>C", [["_C]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>D", [["_D]])

-- Allows Ctrl + C in addition to Esc
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-e>", "<cmd>Oil<cr>")

-- Remove trailing whitespace and comment headers past column 80
vim.keymap.set("n", "Q",
    [[<cmd>silent! %g/-\{3,80\}/s/\%80c.*//<cr>]]
    .. [[<cmd>silent! %s/\s\+$//<cr>]]
)

-- Functions
vim.keymap.set('n', '<leader>q', function()
        for _, ui in pairs(vim.api.nvim_list_uis()) do
            if ui.chan and not ui.stdout_tty then
                vim.fn.chanclose(ui.chan)
            end
        end
    end,
    { noremap = true }
)

-- Search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Jump between left/right window with h and l
vim.keymap.set('n', '<leader>h', '<cmd>wincmd h<CR>')
vim.keymap.set('n', '<leader>l', '<cmd>wincmd l<CR>')
vim.keymap.set('n', '<leader>j', '<cmd>wincmd j<CR>')
vim.keymap.set('n', '<leader>k', '<cmd>wincmd k<CR>')
vim.keymap.set('n', '<M->>', '<cmd>resize -5<cr>')
vim.keymap.set('n', '<M-<>', '<cmd>resize +5<cr>')
vim.keymap.set('n', '<M-.>', '<cmd>vertical-resize -5<cr>')
vim.keymap.set('n', '<M-,>', '<cmd>vertical-resize +5<cr>')

-- This is simply awesome
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Coding Headers Generation Shortcuts
vim.keymap.set({ 'n', 'x' }, '<leader>-', [[mzyyp^<cmd>.,.Commentary<cr>v$r-<cmd>.,.Commentary<cr>`z]], { remap = true })
vim.keymap.set({ 'n', 'x' }, '<leader>_', '<leader>-<leader>-ddp', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<leader>i', '^f(ByiwO<Esc>^"_Dp<Plug>Commentary<leader>-jo<esc><cmd>s/.*//<cr>', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<leader>=j', [[mzo<esc>80i-<esc><cmd>.,.Commentary<cr><cmd>.,.s/\%80c.*//<cr>`z]], { remap = true })
vim.keymap.set({ 'n', 'x' }, '<leader>=k', [[mzO<esc>80i-<esc><cmd>.,.Commentary<cr><cmd>.,.s/\%80c.*//<cr>`z]], { remap = true })
vim.keymap.set({ 'n', 'x' }, '<leader>==', '<leader>=j<leader>=k', { remap = true })
vim.keymap.set({ 'n', 'x' }, '<leader>gl', [[mzggO
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
<Esc><cmd>1,29Commentary<cr>gg^<C-v>28jlxggdd<cmd>1,29s/\%80c.*//<cr>'z]]
)
