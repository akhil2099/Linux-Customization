-- A comprehensive Neovim configuration

-- Performance settings
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 240
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1

-- General settings
vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true      -- Show relative line numbers
vim.opt.termguicolors = true       -- True color support
vim.opt.mouse = 'a'                -- Enable mouse in all modes
vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard
vim.opt.breakindent = true         -- Indent wrapped lines
vim.opt.undofile = true            -- Persistent undo
vim.opt.ignorecase = true          -- Case-insensitive search
vim.opt.smartcase = true           -- Unless uppercase is used
vim.opt.signcolumn = 'yes'         -- Always show signcolumn
vim.opt.updatetime = 250           -- Faster updates
vim.opt.timeoutlen = 300           -- Faster key sequence completion
vim.opt.splitright = true          -- Split windows right
vim.opt.splitbelow = true          -- Split windows below
vim.opt.scrolloff = 8              -- Lines of context
vim.opt.sidescrolloff = 8          -- Columns of context
vim.opt.completeopt = {'menu', 'menuone', 'noselect'} -- Better completion
vim.opt.cursorline = true          -- Highlight current line
vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.tabstop = 2                -- 2 spaces for tabs
vim.opt.shiftwidth = 2             -- 2 spaces for indentation
vim.opt.smartindent = true         -- Smart autoindent
vim.opt.list = true                -- Show some invisible characters
vim.opt.wrap = false               -- No wrap by default

-- Set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic key mappings
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>e', '<cmd>Explore<cr>', { desc = 'Explorer' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Buffer navigation
vim.keymap.set('n', '<Tab>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })

-- Better indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- Easier moving of lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('i', '<A-j>', '<Esc><cmd>m .+1<CR>==gi', { desc = 'Move line down' })
vim.keymap.set('i', '<A-k>', '<Esc><cmd>m .-2<CR>==gi', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Auto-install package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
require("lazy").setup({
  -- Color scheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },


  {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- Set header (new ZEUZ ASCII art)
    dashboard.section.header.val = {
      "",
      "░▒▓████████▓▒░ ░▒▓████████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓████████▓▒░ ",
      "       ░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░        ░▒▓█▓▒░ ",
      "     ░▒▓██▓▒░  ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓██▓▒░  ",
      "   ░▒▓██▓▒░    ░▒▓██████▓▒░   ░▒▓█▓▒░░▒▓█▓▒░    ░▒▓██▓▒░    ",
      " ░▒▓██▓▒░      ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██▓▒░      ",
      "░▒▓█▓▒░        ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ",
      "░▒▓████████▓▒░ ░▒▓████████▓▒░  ░▒▓██████▓▒░  ░▒▓████████▓▒░ ",
      "                                                            ",
      "                                                            ",
      "",
    }

    -- Set menu (large buttons with spacing and prominent icons)
    dashboard.section.buttons.val = {
      dashboard.button('f', '  Find File           ', ':Telescope find_files<CR>'),
      dashboard.button('r', '  Recent Files        ', ':Telescope oldfiles<CR>'),
      dashboard.button('u', '  Update Plugins      ', ':Lazy update<CR>'),
      dashboard.button('q', '  Quit                ', ':qa<CR>'),
    }

    -- Set footer (with ZEUZ and extra padding)
    dashboard.section.footer.val = { "", "", "🚀 Powered by ZEUZ", "" }

    -- Configure (center align and add padding for a "larger" feel)
    dashboard.config.opts = {
      layout = {
        { type = 'padding', val = 4 }, -- More padding at the top
        dashboard.section.header,
        { type = 'padding', val = 2 }, -- Space between header and buttons
        dashboard.section.buttons,
        { type = 'padding', val = 2 }, -- Space between buttons and footer
        dashboard.section.footer,
        { type = 'padding', val = 4 }, -- More padding at the bottom
      },
      noautocmd = true,
    }

    alpha.setup(dashboard.config)
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
},

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin',
          component_separators = '|',
          section_separators = { left = '', right = '' },
        },
      })
    end,
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup()
      vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Explorer' })
    end,
  },

  -- LSP configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
     --     'typescript',
          'pyright',
       --   'rust_analyzer',
        },
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })
     -- require('lspconfig').typescript.setup({ capabilities = capabilities })
      require('lspconfig').pyright.setup({ capabilities = capabilities })
     -- require('lspconfig').rust_analyzer.setup({ capabilities = capabilities })
      
      -- LSP keymaps
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Find references' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format code' })
    end,
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      
      require('luasnip.loaders.from_vscode').lazy_load()
      
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  },

  -- Syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'python', 'rust',
          'c', 'cpp', 'go', 'html', 'css', 'json', 'yaml', 'markdown',
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      require('telescope').load_extension('fzf')
      
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find text' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
      vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, { desc = 'Find in current file' })
    end,
  },

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '│' },
          change = { text = '│' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          
          vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
          vim.keymap.set('n', '<leader>hb', function() gs.blame_line({ full = true }) end, { buffer = bufnr, desc = 'Git blame line' })
          vim.keymap.set('n', '<leader>hd', gs.diffthis, { buffer = bufnr, desc = 'Git diff against index' })
        end,
      })
    end,
  },

  -- Comment toggling
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },

  -- Terminal integration
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        open_mapping = [[<C-\>]],
        direction = 'float',
        float_opts = {
          border = 'curved',
          winblend = 0,
        },
      })
    end,
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function()
      require('ibl').setup()
    end,
  },

  -- Smooth scrolling
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  },

  -- Which-key for keybinding help
  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end,
  },
})

-- Filetype-specific settings
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python' },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Remember cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})


