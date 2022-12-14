local opt = vim.opt

opt.clipboard = 'unnamedplus'       -- enable clipboard support
opt.autoread = true
opt.background = 'dark'
opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- completion options (for deoplete)
opt.cursorline = true               -- highlight current line
opt.encoding = "utf-8"
opt.expandtab = true                -- spaces instead of tabs
opt.hidden = true                   -- enable background buffers
opt.ignorecase = true               -- ignore case in search
opt.joinspaces = false              -- no double spaces with join
opt.list = true                     -- show some invisible characters
opt.maxmempattern = 1000            -- for Riv
opt.mouse = "nv"                    -- Enable mouse in normal and visual modes
opt.number = true                   -- show line numbers
opt.relativenumber = true           -- number relative to current line
opt.scrolloff = 4                   -- lines of context
opt.shiftround = true               -- round indent
opt.shiftwidth = 2                  -- size of indent
opt.sidescrolloff = 8               -- columns of context
opt.smartcase = true                -- do not ignore case with capitals
opt.smartindent = true              -- insert indents automatically
opt.splitbelow = true               -- put new windows below current
opt.splitright = true               -- put new vertical splits to right
opt.termguicolors = true            -- truecolor support
opt.wildmode = {'list', 'longest'}  -- command-line completion mode
opt.wrap = false  -- disable line wrap
