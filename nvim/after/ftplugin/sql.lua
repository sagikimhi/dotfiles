local cmp = require('nvim-cmp')
cmp.setup.filetype({'sql'}, {
    sources = {
        {name="vim-dadbod-completion"},
        {name="nvim-lsp"},
        {name="buffer"},
    }
})
