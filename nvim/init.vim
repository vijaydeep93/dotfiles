" ============================================================================
"  ███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"  ████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"  ██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██║
"  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"  MODERN NEOVIM CONFIGURATION (VS Code Killer + UI Edition)
"  Authors:
"  - Vijaydeep
"  - Gemini
"
"  INSTRUCTIONS:
"  1. Run :PlugInstall inside Neovim.
"  2. Run :Mason to check status.
" ============================================================================

" --- 1. PLUGINS (Vim-Plug) ---
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" > UI & THEME
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/which-key.nvim'
Plug 'goolord/alpha-nvim'
Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'HiPhish/rainbow-delimiters.nvim'
Plug 'RRethy/vim-illuminate' " Highlight matching words under cursor

" > GIT INTEGRATION (Added Gitsigns)
Plug 'lewis6991/gitsigns.nvim'

" > NAVIGATION & TERMINAL
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag': '*'}
Plug 'matze/vim-move'

" > EDITING
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-surround'

" > LSP & AUTOCOMPLETE
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'

" > GEMINI AI
Plug 'stevearc/dressing.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

call plug#end()

" ============================================================================
"  2. GENERAL SETTINGS
" ============================================================================
set number
set relativenumber
set mouse=a
set clipboard+=unnamedplus
set nopaste
set noshowmode
set laststatus=3
set ignorecase
set smartcase
set nohlsearch
set nobackup
set noswapfile
set updatetime=100
set autoread
set spell
set guifont=FantasqueSansMono\ Nerd\ Font\ Mono\ 11
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set incsearch
set termguicolors
set wrap linebreak nolist
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set signcolumn=yes
set expandtab
set exrc
set secure

" Cursor Settings: Block in Normal & Visual modes, Vertical Line in others (Insert, Command)
set guicursor=n-v-ve:block,i-ci-c-r-cr-o-sm:ver25

au VimLeave * set guicursor=n-ci:hor30-iCursor-blinkwait300-blinkon200-blinkoff150

let mapleader = "\\"

" ============================================================================
"  3. PLUGIN CONFIGURATION (LUA)
" ============================================================================
lua << EOF
-- > THEME SETUP
require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    no_italic = true,
    styles = {
        comments = { "italic" },
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        nvimtree = true,
        treesitter = true,
        notify = true,
        noice = true,
        which_key = true,
        mason = true,
        alpha = true,
        illuminate = true,
        gitsigns = true, -- Enable gitsigns integration in theme
    }
})
vim.cmd.colorscheme "catppuccin"

-- > GIT SIGNS (The Git Gutter)
require('gitsigns').setup()

-- > INDENT BLANKLINE
require("ibl").setup({
    indent = { char = "│" },
    scope = { enabled = false },
})

-- > NOTIFICATIONS
vim.notify = require("notify")
require("notify").setup({
    background_colour = "#000000",
    render = "minimal",
    stages = "fade_in_slide_out",
    timeout = 3000,
})

-- > UI OVERHAUL (NOICE)
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  cmdline = {
      format = {
          cmdline = {icon = ""},
      },
  },
})

-- > DASHBOARD
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    [[                                                     ]],
    [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    [[                                                     ]],
    [[             Welcome Back, Vijaydeep                 ]],
    [[                                                     ]],
}
dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("r", "  Recent", ":Telescope oldfiles <CR>"),
    dashboard.button("q", "󰿅  Quit NS", ":qa<CR>"),
}
alpha.setup(dashboard.config)

-- > TABS & STATUS LINE
require("bufferline").setup{
    options = {
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
    }
}
require('lualine').setup({
    options = {
        theme = 'catppuccin',
        section_separators = { left = '', right = '' },
        component_separators = { left = '\\', right = '/' },
        icons_enabled = true,
    },
    sections = {
        lualine_b = { { 'branch', icon = '' }, 'diff', 'diagnostics' },
        lualine_c = { { 'filename', symbols = { readonly = '' } } },
        lualine_z = { { 'location', icon = '' } },
    },
})

-- > BASICS
require("colorizer").setup()
require("nvim-tree").setup({ view = { width = 30 }, filters = { dotfiles = false } })
require("toggleterm").setup({ open_mapping = [[<c-\>]], direction = 'float' })
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "vim", "python", "javascript", "html", "css", "json", "yaml", "bash", "fish", "groovy", "dockerfile" },
    highlight = { enable = true },
}
require('Comment').setup()
require("nvim-autopairs").setup {}
require("which-key").setup({
    triggers = { "<leader>", "g" },
    plugins = {
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = true,
            g = true,
        },
    },
})

-- > LSP CONFIGURATION
require("mason").setup()
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls", "pyright", "lua_ls", "html", "cssls", "bashls", "groovyls", "dockerls", "yamlls", "jsonls" },
    handlers = {
        function (server_name)
            lspconfig[server_name].setup {
                capabilities = capabilities,
            }
        end,
    },
})

-- > AUTOCOMPLETE (CMP)
local cmp = require'cmp'
cmp.setup({
    snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    })
})

-- > GEMINI AI
require('avante').setup({
  provider = "gemini",
  providers = {
    gemini = {
      model = "gemini-2.0-flash",
      temperature = 0,
      max_tokens = 4096,
    },
  },
})
EOF

" ============================================================================
"  4. KEY MAPPINGS
" ============================================================================
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>t :ToggleTerm<CR>

" Format & Documentation
nnoremap <leader>f <cmd>lua vim.lsp.buf.format()<CR>
nnoremap <leader>k <cmd>lua vim.lsp.buf.hover()<CR>

nnoremap <leader>aa <cmd>AvanteChat<CR>
vnoremap <leader>ae <cmd>AvanteEdit<CR>

noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
inoremap ;; <Esc>
nnoremap ; :
inoremap <c-d> <esc>ddi
vnoremap <C-c> "+y
map <C-v> "+P

" terminal 'normal mode'
tmap <esc> <c-\><c-n><esc><cr>

nmap <silent><leader>, :BufferLineCycleNext<CR>
nmap <silent><leader>. :BufferLineCyclePrev<CR>
nnoremap <silent> <leader>q :bdelete<CR>
map <leader>a :NvimTreeToggle<CR>
map <leader>s :setlocal spell! spelllang=en_us<CR>
map <leader>z :e ~/Src/dotfiles/nvim/init.vim<CR>
map <leader>e :e */**/

autocmd BufEnter *.md exe 'noremap <F5> :!google-chrome-stable %:p<CR>'
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd BufWritePre * :%s/\s\+$//e

" Jenkinsfile support (treat as Groovy)
autocmd BufNewFile,BufRead Jenkinsfile,Jenkinsfile.* set filetype=groovy

" Change Color when entering Insert Mode
autocmd InsertEnter * set nocursorline

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * set nocursorline

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <c-s> :mksession!<CR>
if(argc() == 0)
    if filereadable("./Session.vim")
        au VimEnter * nested :source ./Session.vim
    endif
endif
