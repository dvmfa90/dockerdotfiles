local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- nnoremap <leader>ff :Telescope find_files<CR>
-- nnoremap <leader>fh :Telescope oldfiles<CR>
-- nnoremap <leader>fb :Telescope buffers<CR>
-- nnoremap <leader>fl :Lines<CR>
-- General Keys
keymap("n", "<C-e>", "%", opts) -- Go to end of line
keymap("n", "<C-a>", "^", opts) -- Go to being of line
keymap("n", "<leader><CR>", ":so %<CR>", opts) -- source file
keymap("n", "<leader>wo", ":w<CR>", opts) -- write only
keymap("n", "<leader>wq", ":wq<CR>", opts) -- write and quit
keymap("n", "<leader>Y", "y$", opts) -- Yank what is in front of cursor
keymap("n", "<leader>n", "nzzzv", opts)
keymap("n", "<leader>N", "Nzzzv", opts)
keymap("n", "<leader>dt", ":diffthis<CR>", opts) -- open 2 docs in split tab and use this to diff them
keymap("n", "<leader>rs", ":g/^$/d<CR>", opts) -- Delete empty lines

-- keymap("n", "<leader>vs", ":VimwikiVSplitLink<CR>", opts) -- open vimwiki link in vsplit
-- keymap("n", "<leader>ltd", ":Lexplore scp://diogo@10.11.2.15//home/diogo/ <CR>", opts) -- Delete empty lines
-- keymap("n", "<leader>ltd", ":Lexplore scp://root@10.0.70.10//root/config/ <CR>", opts) -- Delete empty lines

-- Whitespace

keymap("n", "<leader>ws", ":StripWhitespace<CR>", opts)


--vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[S]earch [F]iles' })
keymap("n", "<leader>hm", ":Telescope harpoon marks<CR>", opts) -- Delete empty lines
-- keymap("n", "<leader>ha", "require('harpoon.mark'.add_file()", opts) -- Delete empty lines

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-c>", "<C-w>c", opts)
keymap("n", "<C-s>", "<C-w>s", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press ii fast to exit insert mode
keymap("i", "ii", "<ESC>", opts)
keymap("i", "<C-v>", '<C-o>"*p', opts)
--
--
--
-- Visual --
--
--
-- keymap("v", "<leader>rs", ":g/^$/d<CR>", opts) -- Delete empty lines
--
-- General
--
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '>-2<CR>gv=gv", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

