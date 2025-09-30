-- ===============================
-- 基本設定
-- ===============================
vim.opt.encoding = "utf-8"
vim.cmd("language C")
vim.scriptencoding = "utf-8"

vim.opt.shell = "zsh"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.title = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakat = [[\ \	;:,.!?]]
vim.opt.breakindent = true
vim.opt.startofline = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.ruler = true
vim.opt.backspace = { "indent", "eol", "start" }


-- ===============================
-- キーマップ
-- ===============================
local map = vim.keymap.set
map("c", "w!!", "w !sudo tee > /dev/null %<CR> :e!<CR>")
map("n", "<F5>", ":setlocal spell!<CR>")
map("i", "<C-j>", "<ESC>")
map("v", "<C-j>", "<ESC>")
map("n", "<C-j>", "<ESC>")
map("n", "<Space>t", "<Cmd>wincmd n | terminal<CR>")
vim.cmd[[
autocmd TermOpen * :startinsert
]]
map("n", "<Space>n", ":Fern . -reveal=% -drawer -toggle -width=40<CR>")

-- quickfix window
vim.api.nvim_create_augroup("myvimrc", { clear = true })
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  group = "myvimrc",
  pattern = "[^l]*",
  command = "cwindow",
})
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  group = "myvimrc",
  pattern = "l*",
  command = "lwindow",
})


-- ===============================
-- プラグイン管理 (lazy.nvim)
-- ===============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- deoplete & neosnippet
  { "Shougo/deoplete.nvim", build = ":UpdateRemotePlugins" },
  { "Shougo/neosnippet" },
  { "Shougo/neosnippet-snippets" },

  -- ファイル操作
  { "lambdalisue/fern.vim" },
  { "lambdalisue/fern-renderer-nerdfont.vim",
    dependencies = { "lambdalisue/fern.vim" }
  },
  { "lambdalisue/nerdfont.vim",
    dependencies = { "lambdalisue/fern.vim" }
  },
  { "csch0/vim-startify-renderer-nerdfont" },

  -- TeX
  { "lervag/vimtex" },

  -- Markdown
  { "godlygeek/tabular" },
  { "plasticboy/vim-markdown" },

  -- HTML, CSS, JS
  { "mattn/emmet-vim" },
  { "tpope/vim-surround" },
  { "vim-scripts/open-browser.vim" },
  { "hail2u/vim-css3-syntax" },
  { "othree/html5.vim" },
  { "pangloss/vim-javascript" },

  -- その他
  { "cocopon/iceberg.vim" },
  { "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  { "tpope/vim-fugitive" },
  { "pocco81/auto-save.nvim" }
})

-- ===============================
-- プラグイン設定
-- ===============================

-- deoplete
vim.g["deoplete#enable_at_startup"] = 1

-- neosnippet
map("i", "<C-k>", "<Plug>(neosnippet_expand_or_jump)")
map("s", "<C-k>", "<Plug>(neosnippet_expand_or_jump)")
map("x", "<C-k>", "<Plug>(neosnippet_expand_target)")

-- vimtex
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.tex_flavor = "latex"
vim.g.vimtex_indent_enabled = 1
vim.g.vimtex_compiler_latexmk = {
  callback = 1,
  continuous = 1,
  options = {
    "-pdfdvi", "-verbose", "-file-line-error",
    "-synctex=1", "-interaction=nonstopmode",
  },
}

-- markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_new_list_item_indent = 0
vim.g.vim_markdown_auto_insert_bullets = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_math = 1

-- fern
vim.g["fern#renderer"] = "nerdfont"

-- emmet
vim.g.user_emmet_mode = "iv"
vim.g.user_emmet_leader_key = "<C-Y>"
vim.g.use_emmet_complete_tag = 1

-- open-browser
map("n", "<Leader>o", "<Plug>(openbrowser-open)")
map("v", "<Leader>o", "<Plug>(openbrowser-open)")
map("n", "<Leader>g", ":OpenBrowserSearch <C-r><C-w><CR>")

--lualine
require('lualine').setup {
  options = { theme = "iceberg_dark" },
  options = { section_separators = '', component_separators = '' }
}

-- ===============================
-- その他の設定
-- ===============================
vim.cmd.colorscheme("iceberg")


-- ===============================
-- terminal mode
-- ===============================
-- key mapping
-- **move between two windows**
map("t", "<C-w>l", "<Cmd>wincmd l<CR>")
map("t", "<C-w>h", "<Cmd>wincmd h<CR>")
map("t", "<C-w>j", "<Cmd>wincmd j<CR>")
map("t", "<C-w>k", "<Cmd>wincmd k<CR>")
map("t", "<C-w>w", "<Cmd>wincmd w<CR>")
map("t", "<C-w>b", "<Cmd>wincmd b<CR>")

-- close the window
map("t", "<C-w>q", "<Cmd>wincmd q<CR>")

-- from terminal-job to terminal-normal
map("t", "<ESC>", "<C-\\><C-n>")
map("t", "<C-j>", "<C-\\><C-n>")

-- do not show `[process exited 0]`
vim.cmd([[
  autocmd TermClose * if !v:event.status | execute "bdelete! " . expand("<abuf>") | endif
]])
