vim.g.mapleader = " "

local keymap = vim.keymap

local check_file_type_and_save = function()
	local file_type = vim.api.nvim_buf_get_option(0, "filetype")
	if file_type == "rust" then
		vim.cmd("RustFmt | wa")
	else
		vim.cmd("wa")
	end
end

keymap.set("i", "jk", "<ESC>")
-- keymap.set("n", "<leader>s", ":RustFmt<CR> | :wa<CR>")
keymap.set("n", "<leader>s", check_file_type_and_save)

keymap.set("n", "<leader>q", ":wq<CR>")
-- keymap.set("n", "<leader>k", ":bnext<CR>")
-- keymap.set("n", "<leader>j", ":bprev<CR>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>|", "<C-w>v")         -- split window vertically
keymap.set("n", "<leader>-", "<C-w>s")         -- split window horizontally
keymap.set("n", "<leader>xx", ":close<CR>")    -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- previous tab

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Git fugitive
-- keymap.set("n", "<leader>g", ":G<CR>")
-- keymap.set("n", "<leader>gaa", ":G add")
-- keymap.set("n", "<leader>ga", ":G add .<CR>")
-- keymap.set("n", "<leader>gc", ":G commit<CR>")
-- keymap.set("n", "<leader>gd", ":G pull<CR>")
-- keymap.set("n", "<leader>gu", ":G push<CR>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")                             -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")                              -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")                            -- find string under cursor in current working directory
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")                                 -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")                              -- list available help tags
-- keymap.set("n", "<leader>r", "<cmd>lua require('telescope.builtin').oldfiles()<cr>") -- recent files
keymap.set("n", "<leader>7", "<cmd>lua require('telescope.builtin').treesitter()<cr>")     -- recent files
keymap.set("n", "<leader>1", "<cmd>lua require('telescope.builtin').lsp_references()<cr>") -- list references of word under cursor

-- Harpoon
keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>")
keymap.set("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
keymap.set("n", "<leader>k", "<cmd>lua require('harpoon.ui').nav_next()<CR>")
keymap.set("n", "<leader>j", "<cmd>lua require('harpoon.ui').nav_prev()<CR>")
keymap.set("n", "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
keymap.set("n", "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
keymap.set("n", "<leader>0", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")

-- Vimspector
-- keymap.set("n", "F9", "<cmd>call vimspector#Launch()<cr>")
-- keymap.set("n", "db", ":call vimspector#ToggleBreakpoint()<cr>")

-- Nvim DAP
keymap.set("n", "db", ":lua require'dap'.toggle_breakpoint()<CR>")

-- Comment
local api = require("Comment.api")
local config = require("Comment.config"):get()

keymap.set("n", "<leader>/", api.toggle.linewise.current)
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
-- Toggle selection (blockwise)
keymap.set("x", "<leader>/", function()
	vim.api.nvim_feedkeys(esc, "nx", false)
	api.toggle.linewise(vim.fn.visualmode())
end)

-- Trouble
keymap.set("n", "<leader>2", "<cmd>TroubleToggle<cr>") -- diagnostics
