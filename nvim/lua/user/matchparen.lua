require('matchparen').setup(
    {
        on_startup = true, -- Should it be enabled by default
        timeout = 150, -- timeout in ms to drop searching for matched character in normal mode
        timeout_insert = 50, -- same but in insert mode
        hl_group = 'MatchParen', -- highlight group for matched characters
        augroup_name = 'matchparen', -- almost no reason to touch this unless
        -- list of neovim default syntax names to match brackets only in this blocks
        syntax_skip_groups = {
            'string',
            'comment',
            'character',
            'singlequoute',
            'escape',
            'symbol'
        },
        -- list of TreeSitter query captures to match brackets only in this blocks
        ts_skip_groups = {
            'string',
            'comment'
        }
    }
)
