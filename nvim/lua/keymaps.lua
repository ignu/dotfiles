local wk = require('which-key')
wk.register(
    {
        f = {
            name = 'file', -- optional group name
            f = {'<cmd>Telescope find_files<cr>', 'Find File'}, -- create a binding with label
            r = {'<cmd>Telescope oldfiles<cr>', 'Open Recent File', noremap = false, buffer = 123}, -- additional options for creating the keymap
            b = {'<cmd>Telescope buffers<cr>', 'Buffers'}, -- additional options for creating the keymap
            h = {'<cmd>Telescope help tags<cr>', 'Buffers'} -- additional options for creating the keymap
        }
    },
    {prefix = '<leader>'}
)
