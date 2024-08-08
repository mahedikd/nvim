require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "ESC" })
map("n", "<leader>ws", ":w<cr>", { desc = "Save" })
map("n", "<leader>wq", ":wq!<cr>", { desc = "Save and Quite" })
map("n", "<leader>qq", ":q!<cr>", { desc = "Quite nvim forced" })
map("n", "<leader>q", ":q<cr>", { desc = "Quite nvim" })
map("n", "<leader>h", ":HopWord<CR>,", { desc = "Hop word" })
map("n", "<leader>tt", ":Twilight<CR>", { desc = "Twilight" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- more keybinds!
-- M.dap = {
--   plugin = true,
--   n = {
--     ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
--   },
-- }
--
-- M.dap_python = {
--   plugin = true,
--   n = {
--     ["<leader>dpr"] = {
--       function()
--         require("dap-python").test_method()
--       end,
--     },
--   },
-- }
