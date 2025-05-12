vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness


-- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
-- keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

keymap.set("n", "<C-e>", "%", { desc = "Go to end line" })
keymap.set("n", "<C-a>", "^", { desc = "Go to beggining line" })
keymap.set("n", "<leader><CR>", ":so %<CR>", { desc = "Source file" })
keymap.set("n", "<leader>wo", ":w<CR>", { desc = "Write only" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "write and quite" })
keymap.set("n", "<leader>Y", "y$", { desc = "Yanks everything in front of cursor" })
keymap.set("n", "<leader>n", "nzzzv", { desc = "not sure" })
keymap.set("n", "<leader>N", "Nzzzv", { desc = "??" })
keymap.set("n", "<leader>dt", ":diffthis<CR>", { desc = "diff this" })
keymap.set("n", "<leader>rs", ":g/^$/d<CR>", { desc = "Delete empty lines" })

-- keymap("n", "<leader>vs", ":VimwikiVSplitLink<CR>", opts) -- open vimwiki link in vsplit
-- keymap("n", "<leader>ltd", ":Lexplore scp://diogo@10.11.2.15//home/diogo/ <CR>", opts) -- Delete empty lines
-- keymap("n", "<leader>ltd", ":Lexplore scp://root@10.0.70.10//root/config/ <CR>", opts) -- Delete empty lines

-- Whitespace

keymap.set("n", "<leader>ws", ":StripWhitespace<CR>", { desc = "Strip whitespaces" })


--vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[S]earch [F]iles' })
-- keymap("n", "<leader>hm", ":Telescope harpoon marks<CR>", opts) -- Delete empty lines
-- keymap("n", "<leader>ha", "require('harpoon.mark'.add_file()", opts) -- Delete empty lines

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go down window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "go up window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "go left window" })
-- keymap("n", "<C-c>", "<C-w>c", opts)
keymap.set("n", "<C-s>", "<C-w>s", { desc = "split window" })
-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize up" })
keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize down" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize left" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize right" })

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "next buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press ii fast to exit insert mode
-- keymap("i", "ii", "<ESC>", { desc = "exit insert mode" })
keymap.set("i", "<C-v>", '<C-o>"*p', { desc = "paste" })
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
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "move line up" })

-- Stay in indent mode
keymap.set("v", "<", "<gv", { desc = "ident right" })
keymap.set("v", ">", ">gv", { desc = "ident left" })

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", { desc = "ssss" })
keymap.set("v", "<A-k>", ":m .-2<CR>==", { desc = "sdasds" })
keymap.set("v", "p", '"_dP', { desc = "ssdsds" })

-- Visual Block --
-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "sdasdsa" })
keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "dsadasdwa" })
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "dsadasdas" })
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "sdasdasds" })

-- window management
