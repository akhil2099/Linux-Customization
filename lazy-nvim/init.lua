-- init.lua
-- A comprehensive Neovim configuration

-- Performance settings
-- vim.opt.lazyredraw = true
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
vim.opt.foldmethod = 'expr'                    -- Use expression-based folding
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Use Treesitter for folding
vim.opt.foldenable = false                     -- Disable folding by default
vim.opt.foldlevel = 99                         -- Open all folds by default

-- Set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic key mappings
vim.keymap.set('n', '<leader>e', '<cmd>Explore<cr>', { desc = 'Explorer' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })

-- Tab management
vim.keymap.set('n', '<leader>t', '<cmd>tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>q', '<cmd>tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<C-Left>', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<C-Right>', '<cmd>tabnext<CR>', { desc = 'Next tab' })


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


-- Folding keybindings
vim.keymap.set('n', '<leader>zf', 'za', { desc = 'Toggle fold under cursor' })
vim.keymap.set('n', '<leader>zo', 'zR', { desc = 'Open all folds' })
vim.keymap.set('n', '<leader>zc', 'zM', { desc = 'Close all folds' })

-- Function to display shortcuts help in a floating window
function _G.show_shortcuts_help()
  -- Create a new scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'swapfile', false)

  -- Read the help file
  local help_file = vim.fn.expand('~/.config/nvim/shortcuts-help.txt')
  local lines = vim.fn.readfile(help_file)

  -- Set the lines in the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Open a floating window
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = 'minimal',
    border = 'rounded',
  })

  -- Set buffer options for readability
  vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown') -- For syntax highlighting
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'readonly', true)

  -- Map 'q' to close the window
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
end

-- Keybinding to show the help
vim.keymap.set('n', '<leader>sh', ':lua show_shortcuts_help()<CR>', { desc = 'Show shortcuts help' })


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
    "justinhj/battery.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
    config = function()
      require("battery").setup({
        update_rate_seconds = 30,           -- Refresh every 30 seconds
        show_status_when_no_battery = true, -- Show icon for desktops
        show_plugged_icon = true,           -- Show cable icon when plugged
        show_unplugged_icon = true,         -- Show disconnected icon when unplugged
        show_percent = true,                -- Show percentage
        vertical_icons = true,              -- Use vertical battery icons
        multiple_battery_selection = 1,      -- Select first battery if multiple
      })
    end,
  },
{
  "folke/noice.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  config = function()
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  cmdline = {
    view = "cmdline_popup", -- Use popup for cmdline (optional, try this if issues persist)
    format = {
      search_down = { kind = "search", pattern = "^/", icon = "🔍", lang = "regex" },
      search_up = { kind = "search", pattern = "^?", icon = "🔍", lang = "regex" },
    },
  },
  search = {
    incremental = true, -- Enable incremental search
  },
})
    end,
},

 {
  "gorbit99/codewindow.nvim",
  config = function()
    local codewindow = require("codewindow")
    codewindow.setup({
      auto_enable = false,
      exclude_filetypes = { "NvimTree", "alpha", "TelescopePrompt" },
      window_border = "rounded",
      max_minimap_height = nil,
      use_lsp = true,
      use_treesitter = true,
      minimap_width = 15,
      width_multiplier = 2, -- wider minimap_width
    })

    codewindow.apply_default_keybinds()

    vim.keymap.set('n', '<leader>m',  codewindow.toggle_minimap, { desc = 'Toggle Minimap' })
    vim.keymap.set('n', '<leader>mf', codewindow.toggle_focus,   { desc = 'Focus Minimap' })
    vim.keymap.set('n', '<leader>mc', codewindow.close_minimap,  { desc = 'Close Minimap' })

    -- 🌈 Bolder Diagnostic Colors
    vim.api.nvim_set_hl(0, "CodewindowError",   { fg = "#f38ba8", bold = true })
    vim.api.nvim_set_hl(0, "CodewindowWarning", { fg = "#f9e2af", bold = true })
    vim.api.nvim_set_hl(0, "CodewindowInfo",    { fg = "#89b4fa", bold = true })
    vim.api.nvim_set_hl(0, "CodewindowHint",    { fg = "#a6e3a1", bold = true })
  end,
},


   {
  "akinsho/bufferline.nvim",
  version = "v4.*", -- Pin to stable version for reliability
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Debug print to confirm setup is running
    print("Bufferline setup running")
    require("bufferline").setup({
      options = {
        mode = "tabs", -- Use tabs instead of buffers
        separator_style = {"▎", "▎"}, -- Custom vertical bar separators
        diagnostics = "nvim_lsp", -- Show LSP diagnostics
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}, -- Show close button on hover
        },
        show_buffer_close_icons = true,
        show_close_icon = true,
        buffer_close_icon = "✖", -- Custom close icon
        modified_icon = "●", -- Custom modified buffer icon
        color_icons = true, -- Enable colored icons
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        max_name_length = 16, -- Compact tab names
        tab_size = 18, -- Compact tab width
        offsets = {
          {
            filetype = "neo-tree",
            text = "🖿 File Explorer",
            text_align = "left",
            separator = true,
          },
        },
        name_formatter = function(buf)
          return vim.fn.fnamemodify(buf.name, ":t") -- Show only file name
        end,
        custom_areas = {
          right = function()
            return {
              { text = "  ", fg = "#1e1e2e" }, -- Right padding
            }
          end,
        },
      },
      highlights = {
        fill = {
          bg = "#181825", -- Dark background for tabline
        },
        background = {
          fg = "#6c7086", -- Muted foreground for unselected tabs
          bg = "#181825",
        },
        tab = {
          fg = "#6c7086",
          bg = "#181825",
        },
        tab_selected = {
          fg = "#b4befe", -- Bright foreground for selected tab
          bg = "#313244", -- Slightly lighter background for selected tab
          gui = "bold,italic", -- Bold and italic for emphasis
        },
        separator = {
          fg = "#181825", -- Match tabline background
          bg = "#181825",
        },
        separator_selected = {
          fg = "#313244",
          bg = "#313244",
        },
        indicator_selected = {
          fg = "#f38ba8", -- Pink indicator for selected tab
          bg = "#313244",
        },
        modified = {
          fg = "#f9e2af", -- Yellow for modified buffers
          bg = "#181825",
        },
        modified_selected = {
          fg = "#f9e2af",
          bg = "#313244",
        },
        close_button = {
          fg = "#f38ba8", -- Pink close button
          bg = "#181825",
        },
        close_button_selected = {
          fg = "#f38ba8",
          bg = "#181825",
        },
      },
    })
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
        sections = {
          lualine_x = { 'encoding', 'fileformat', 'filetype', require("battery").get_status_line },
        },
        sections = {
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
          require("battery").get_status_line,
          function() return os.date("%H:%M:%S") end, -- Live time updated every second
        },
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
    require("neo-tree").setup({
      close_if_last_window = false, -- Keep Neo-tree open even if it's the last window
      filesystem = {
        filtered_items = {
          visible = false, -- Hide dotfiles by default
          hide_dotfiles = true,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true, -- Auto-focus the explorer on the current file
        },
      },
      window = {
        position = "left", -- Sidebar on the left
        width = 30, -- Fixed width for the explorer
        mappings = {
          ["<Tab>"] = function(state)
            local node = state.tree:get_node()
            if node.type == "file" then
              -- Open file in a new tab and keep Neo-tree open
              vim.cmd("tabnew " .. node.path)
              vim.cmd("Neotree reveal left") -- Reopen Neo-tree in the new tab
            end
          end,
          ["a"] = {
            "add",
            config = { show_path = "relative" },
          },
          ["A"] = {
            "add_directory",
            config = { show_path = "relative" },
          },
          ["r"] = {
            "rename",
            config = { show_path = "relative" },
          },
          ["x"] = {
            "cut_to_clipboard",
            config = { show_path = "relative" },
          },
          ["p"] = {
            "paste_from_clipboard",
            config = { show_path = "relative" },
          },
          ["d"] = {
            "delete",
            config = { show_path = "relative" },
          },
        },
      },
    })

    -- Keymapping to toggle Neo-tree
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Explorer' })

    -- Autocommand to open Neo-tree when Neovim starts in a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if arg and vim.fn.isdirectory(arg) == 1 then
          vim.cmd("Neotree reveal left")
        end
      end,
    })

    -- Autocommand to ensure Neo-tree stays open when switching tabs
    vim.api.nvim_create_autocmd("TabEnter", {
      callback = function()
        -- Check if Neo-tree is not already open in the current tab
        if not vim.bo.filetype == "neo-tree" then
          vim.cmd("Neotree reveal left")
        end
      end,
    })
  end,
}, -- LSP configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim', version = '1.28.0' }, -- Pin to stable version
    { 'hrsh7th/cmp-nvim-lsp' },
  },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'pyright',
        },
        automatic_installation = false,
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
      require('lspconfig').pyright.setup({ capabilities = capabilities })
      
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
        'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'python', 'rust', 'bash', 'regex',
        'c', 'cpp', 'go', 'html', 'css', 'json', 'yaml', 'markdown',
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          },
        },
      },
      -- Add this for folding
      fold = { enable = true },
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
      -- Custom function to search all files in the system
    vim.keymap.set('n', '<leader>*', function()
      builtin.find_files({
        cwd = '/', -- Start search from root
        hidden = true, -- Include hidden files
        no_ignore = true, -- Ignore .gitignore and similar
        find_command = { 'find', '-type', 'f' }, -- Use `find` to list all files
      })
    end, { desc = 'Find all files in system' })
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


