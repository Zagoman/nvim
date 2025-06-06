local keymap = vim.keymap -- for conciseness

vim.g.mapleader = " "

--------------------  CMD enter command mode with ; -------------------
keymap.set("n", ";", ":", { desc = "CMD enter command mode" })

--------------------  File tree ; -------------------
keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "File tree" })

--------------------  Move highlighted lines up and down ; -------------------
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--------------------  Move page down/up and keep it centered  -------------------
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("x", "<leader>p", [["_dP]])

--------------------  Yanks to clipboard  -------------------
keymap.set({ "n", "v" }, "<leader>y", [["+y]])

--------------------  ctrc+c mapped to ESC  -------------------
keymap.set("i", "<C-c>", "<Esc>")

keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart LSP rename" })

------------------- easy dotnet stuff -----------------------
keymap.set("n", "<leader>dn", "<CMD>Dotnet<CR>", { desc = "Dotnet commands" })

------------------- Overseer -----------------------
keymap.set("n", "<leader>ov", "<CMD>OverseerToggle<CR>", { desc = "Overseer Toggle" })
keymap.set("n", "<leader>or", "<CMD>OverseerRun<CR>", { desc = "Overseer Run" })

--------------------  Movement Keys in Insert Mode -------------------
-- keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" }) -- move to the beginning of the line
-- keymap.set("i", "<C-e>", "<End>", { desc = "Move End of line" }) -- move to the end of the line
-- keymap.set("i", "<C-h>", "<Left>", { desc = "Move Left" }) -- move left
-- keymap.set("i", "<C-l>", "<Right>", { desc = "Move Right" }) -- move right
-- keymap.set("i", "<C-j>", "<Down>", { desc = "Move Down" }) -- move down
-- keymap.set("i", "<C-k>", "<Up>", { desc = "Move Up" }) -- move up
